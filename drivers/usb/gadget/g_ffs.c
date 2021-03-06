#include <linux/module.h>
#include <linux/utsname.h>


/*
 * kbuild is not very cooperative with respect to linking separately
 * compiled library objects into one module.  So for now we won't use
 * separate compilation ... ensuring init/exit sections work to shrink
 * the runtime footprint, and giving us at least some parts of what
 * a "gcc --combine ... part1.c part2.c part3.c ... " build would.
 */

#ifdef CONFIG_USB_SENSE_OVERLAY
#include "composite_sense.c"
#else
#include "composite.c"
#endif
#include "usbstring.c"
#include "config.c"
#include "epautoconf.c"

#if defined CONFIG_USB_FUNCTIONFS_ETH || defined CONFIG_USB_FUNCTIONFS_RNDIS
#  if defined USB_ETH_RNDIS
#    undef USB_ETH_RNDIS
#  endif
#  ifdef CONFIG_USB_FUNCTIONFS_RNDIS
#    define USB_ETH_RNDIS y
#  endif

#  include "f_ecm.c"
#  include "f_subset.c"
#  ifdef USB_ETH_RNDIS
#    ifdef CONFIG_USB_SENSE_OVERLAY
#      include "f_rndis_sense.c"
#    else
#      include "f_rndis.c"
#    endif
#    include "rndis.c"
#  endif
#  include "u_ether.c"

static u8 gfs_hostaddr[ETH_ALEN];
#else
#  if !defined CONFIG_USB_FUNCTIONFS_GENERIC
#    define CONFIG_USB_FUNCTIONFS_GENERIC
#  endif
#  define gether_cleanup() do { } while (0)
#  define gether_setup(gadget, hostaddr)   ((int)0)
#endif

#include "f_fs.c"


#define DRIVER_NAME	"g_ffs"
#define DRIVER_DESC	"USB Function Filesystem"
#define DRIVER_VERSION	"24 Aug 2004"

MODULE_DESCRIPTION(DRIVER_DESC);
MODULE_AUTHOR("Michal Nazarewicz");
MODULE_LICENSE("GPL");


static unsigned short gfs_vendor_id    = 0x0525;	/* XXX NetChip */
static unsigned short gfs_product_id   = 0xa4ac;	/* XXX */

static struct usb_device_descriptor gfs_dev_desc = {
	.bLength		= sizeof gfs_dev_desc,
	.bDescriptorType	= USB_DT_DEVICE,

	.bcdUSB			= cpu_to_le16(0x0200),
	.bDeviceClass		= USB_CLASS_PER_INTERFACE,

	/* Vendor and product id can be overridden by module parameters.  */
	/* .idVendor		= cpu_to_le16(gfs_vendor_id), */
	/* .idProduct		= cpu_to_le16(gfs_product_id), */
	/* .bcdDevice		= f(hardware) */
	/* .iManufacturer	= DYNAMIC */
	/* .iProduct		= DYNAMIC */
	/* NO SERIAL NUMBER */
	.bNumConfigurations	= 1,
};

#define GFS_MODULE_PARAM_DESC(name, field) \
	MODULE_PARM_DESC(name, "Value of the " #field " field of the device descriptor sent to the host.  Takes effect only prior to the user-space driver registering to the FunctionFS.")

module_param_named(usb_class,    gfs_dev_desc.bDeviceClass,    byte,   0644);
GFS_MODULE_PARAM_DESC(usb_class, bDeviceClass);
module_param_named(usb_subclass, gfs_dev_desc.bDeviceSubClass, byte,   0644);
GFS_MODULE_PARAM_DESC(usb_subclass, bDeviceSubClass);
module_param_named(usb_protocol, gfs_dev_desc.bDeviceProtocol, byte,   0644);
GFS_MODULE_PARAM_DESC(usb_protocol, bDeviceProtocol);
module_param_named(usb_vendor,   gfs_vendor_id,                ushort, 0644);
GFS_MODULE_PARAM_DESC(usb_vendor, idVendor);
module_param_named(usb_product,  gfs_product_id,               ushort, 0644);
GFS_MODULE_PARAM_DESC(usb_product, idProduct);



static const struct usb_descriptor_header *gfs_otg_desc[] = {
	(const struct usb_descriptor_header *)
	&(const struct usb_otg_descriptor) {
		.bLength		= sizeof(struct usb_otg_descriptor),
		.bDescriptorType	= USB_DT_OTG,

		/* REVISIT SRP-only hardware is possible, although
		 * it would not be called "OTG" ... */
		.bmAttributes		= USB_OTG_SRP | USB_OTG_HNP,
	},

	NULL
};

/* string IDs are assigned dynamically */

enum {
	GFS_STRING_MANUFACTURER_IDX,
	GFS_STRING_PRODUCT_IDX,
#ifdef CONFIG_USB_FUNCTIONFS_RNDIS
	GFS_STRING_RNDIS_CONFIG_IDX,
#endif
#ifdef CONFIG_USB_FUNCTIONFS_ETH
	GFS_STRING_ECM_CONFIG_IDX,
#endif
#ifdef CONFIG_USB_FUNCTIONFS_GENERIC
	GFS_STRING_GENERIC_CONFIG_IDX,
#endif
};

static       char gfs_manufacturer[50];
static const char gfs_driver_desc[] = DRIVER_DESC;
static const char gfs_short_name[]  = DRIVER_NAME;

static struct usb_string gfs_strings[] = {
	[GFS_STRING_MANUFACTURER_IDX].s = gfs_manufacturer,
	[GFS_STRING_PRODUCT_IDX].s = gfs_driver_desc,
#ifdef CONFIG_USB_FUNCTIONFS_RNDIS
	[GFS_STRING_RNDIS_CONFIG_IDX].s = "FunctionFS + RNDIS",
#endif
#ifdef CONFIG_USB_FUNCTIONFS_ETH
	[GFS_STRING_ECM_CONFIG_IDX].s = "FunctionFS + ECM",
#endif
#ifdef CONFIG_USB_FUNCTIONFS_GENERIC
	[GFS_STRING_GENERIC_CONFIG_IDX].s = "FunctionFS",
#endif
	{  } /* end of list */
};

static struct usb_gadget_strings *gfs_dev_strings[] = {
	&(struct usb_gadget_strings) {
		.language	= 0x0409,	/* en-us */
		.strings	= gfs_strings,
	},
	NULL,
};


#ifdef CONFIG_USB_FUNCTIONFS_RNDIS
static int gfs_do_rndis_config(struct usb_configuration *c);

static struct usb_configuration gfs_rndis_config_driver = {
	.label			= "FunctionFS + RNDIS",
	.bind			= gfs_do_rndis_config,
	.bConfigurationValue	= 1,
	/* .iConfiguration	= DYNAMIC */
	.bmAttributes		= USB_CONFIG_ATT_SELFPOWER,
};
#  define gfs_add_rndis_config(cdev) \
	usb_add_config(cdev, &gfs_rndis_config_driver)
#else
#  define gfs_add_rndis_config(cdev) 0
#endif


#ifdef CONFIG_USB_FUNCTIONFS_ETH
static int gfs_do_ecm_config(struct usb_configuration *c);

static struct usb_configuration gfs_ecm_config_driver = {
	.label			= "FunctionFS + ECM",
	.bind			= gfs_do_ecm_config,
	.bConfigurationValue	= 1,
	/* .iConfiguration	= DYNAMIC */
	.bmAttributes		= USB_CONFIG_ATT_SELFPOWER,
};
#  define gfs_add_ecm_config(cdev) \
	usb_add_config(cdev, &gfs_ecm_config_driver)
#else
#  define gfs_add_ecm_config(cdev) 0
#endif


#ifdef CONFIG_USB_FUNCTIONFS_GENERIC
static int gfs_do_generic_config(struct usb_configuration *c);

static struct usb_configuration gfs_generic_config_driver = {
	.label			= "FunctionFS",
	.bind			= gfs_do_generic_config,
	.bConfigurationValue	= 2,
	/* .iConfiguration	= DYNAMIC */
	.bmAttributes		= USB_CONFIG_ATT_SELFPOWER,
};
#  define gfs_add_generic_config(cdev) \
	usb_add_config(cdev, &gfs_generic_config_driver)
#else
#  define gfs_add_generic_config(cdev) 0
#endif


static int gfs_bind(struct usb_composite_dev *cdev);
static int gfs_unbind(struct usb_composite_dev *cdev);

static struct usb_composite_driver gfs_driver = {
	.name		= gfs_short_name,
	.dev		= &gfs_dev_desc,
	.strings	= gfs_dev_strings,
	.bind		= gfs_bind,
	.unbind		= gfs_unbind,
};


static struct ffs_data *gfs_ffs_data;
static unsigned long gfs_registered;


static int  gfs_init(void)
{
	ENTER();

	return functionfs_init();
}
module_init(gfs_init);

static void  gfs_exit(void)
{
	ENTER();

	if (test_and_clear_bit(0, &gfs_registered))
		usb_composite_unregister(&gfs_driver);

	functionfs_cleanup();
}
module_exit(gfs_exit);


static int functionfs_ready_callback(struct ffs_data *ffs)
{
	int ret;

	ENTER();

	if (WARN_ON(test_and_set_bit(0, &gfs_registered)))
		return -EBUSY;

	gfs_ffs_data = ffs;
	ret = usb_composite_register(&gfs_driver);
	if (unlikely(ret < 0))
		clear_bit(0, &gfs_registered);
	return ret;
}

static void functionfs_closed_callback(struct ffs_data *ffs)
{
	ENTER();

	if (test_and_clear_bit(0, &gfs_registered))
		usb_composite_unregister(&gfs_driver);
}


static int functionfs_check_dev_callback(const char *dev_name)
{
	return 0;
}



static int gfs_bind(struct usb_composite_dev *cdev)
{
	int ret;

	ENTER();

	if (WARN_ON(!gfs_ffs_data))
		return -ENODEV;

	ret = gether_setup(cdev->gadget, gfs_hostaddr);
	if (unlikely(ret < 0))
		goto error_quick;

	gfs_dev_desc.idVendor  = cpu_to_le16(gfs_vendor_id);
	gfs_dev_desc.idProduct = cpu_to_le16(gfs_product_id);

	snprintf(gfs_manufacturer, sizeof gfs_manufacturer, "%s %s with %s",
		 init_utsname()->sysname, init_utsname()->release,
		 cdev->gadget->name);
	ret = usb_string_id(cdev);
	if (unlikely(ret < 0))
		goto error;
	gfs_strings[GFS_STRING_MANUFACTURER_IDX].id = ret;
	gfs_dev_desc.iManufacturer = ret;

	ret = usb_string_id(cdev);
	if (unlikely(ret < 0))
		goto error;
	gfs_strings[GFS_STRING_PRODUCT_IDX].id = ret;
	gfs_dev_desc.iProduct = ret;

#ifdef CONFIG_USB_FUNCTIONFS_RNDIS
	ret = usb_string_id(cdev);
	if (unlikely(ret < 0))
		goto error;
	gfs_strings[GFS_STRING_RNDIS_CONFIG_IDX].id = ret;
	gfs_rndis_config_driver.iConfiguration = ret;
#endif

#ifdef CONFIG_USB_FUNCTIONFS_ETH
	ret = usb_string_id(cdev);
	if (unlikely(ret < 0))
		goto error;
	gfs_strings[GFS_STRING_ECM_CONFIG_IDX].id = ret;
	gfs_ecm_config_driver.iConfiguration = ret;
#endif

#ifdef CONFIG_USB_FUNCTIONFS_GENERIC
	ret = usb_string_id(cdev);
	if (unlikely(ret < 0))
		goto error;
	gfs_strings[GFS_STRING_GENERIC_CONFIG_IDX].id = ret;
	gfs_generic_config_driver.iConfiguration = ret;
#endif

	ret = functionfs_bind(gfs_ffs_data, cdev);
	if (unlikely(ret < 0))
		goto error;

	ret = gfs_add_rndis_config(cdev);
	if (unlikely(ret < 0))
		goto error_unbind;

	ret = gfs_add_ecm_config(cdev);
	if (unlikely(ret < 0))
		goto error_unbind;

	ret = gfs_add_generic_config(cdev);
	if (unlikely(ret < 0))
		goto error_unbind;

	return 0;

error_unbind:
	functionfs_unbind(gfs_ffs_data);
error:
	gether_cleanup();
error_quick:
	gfs_ffs_data = NULL;
	return ret;
}

static int gfs_unbind(struct usb_composite_dev *cdev)
{
	ENTER();

	/* We may have been called in an error recovery frem
	 * composite_bind() after gfs_unbind() failure so we need to
	 * check if gfs_ffs_data is not NULL since gfs_bind() handles
	 * all error recovery itself.  I'd rather we werent called
	 * from composite on orror recovery, but what you're gonna
	 * do...? */

	if (gfs_ffs_data) {
		gether_cleanup();
		functionfs_unbind(gfs_ffs_data);
		gfs_ffs_data = NULL;
	}

	return 0;
}


static int __gfs_do_config(struct usb_configuration *c,
			   int (*eth)(struct usb_configuration *c, u8 *ethaddr),
			   u8 *ethaddr)
{
	int ret;

	if (WARN_ON(!gfs_ffs_data))
		return -ENODEV;

	if (gadget_is_otg(c->cdev->gadget)) {
		c->descriptors = gfs_otg_desc;
		c->bmAttributes |= USB_CONFIG_ATT_WAKEUP;
	}

	if (eth) {
		ret = eth(c, ethaddr);
		if (unlikely(ret < 0))
			return ret;
	}

	ret = functionfs_add(c->cdev, c, gfs_ffs_data);
	if (unlikely(ret < 0))
		return ret;

	/* After previous do_configs there may be some invalid
	 * pointers in c->interface array.  This happens every time
	 * a user space function with fewer interfaces than a user
	 * space function that was run before the new one is run.  The
	 * compasit's set_config() assumes that if there is no more
	 * then MAX_CONFIG_INTERFACES interfaces in a configuration
	 * then there is a NULL pointer after the last interface in
	 * c->interface array.  We need to make sure this is true. */
	if (c->next_interface_id < ARRAY_SIZE(c->interface))
		c->interface[c->next_interface_id] = NULL;

	return 0;
}

#ifdef CONFIG_USB_FUNCTIONFS_RNDIS
static int gfs_do_rndis_config(struct usb_configuration *c)
{
	ENTER();

	return __gfs_do_config(c, rndis_bind_config, gfs_hostaddr);
}
#endif

#ifdef CONFIG_USB_FUNCTIONFS_ETH
static int gfs_do_ecm_config(struct usb_configuration *c)
{
	ENTER();

	return __gfs_do_config(c,
			       can_support_ecm(c->cdev->gadget)
			     ? ecm_bind_config : geth_bind_config,
			       gfs_hostaddr);
}
#endif

#ifdef CONFIG_USB_FUNCTIONFS_GENERIC
static int gfs_do_generic_config(struct usb_configuration *c)
{
	ENTER();

	return __gfs_do_config(c, NULL, NULL);
}
#endif
