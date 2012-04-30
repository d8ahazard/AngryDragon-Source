/*
 * u_audio.h -- interface to USB gadget "ALSA AUDIO" utilities
 *
 * Copyright (C) 2008 Bryan Wu <cooloney@kernel.org>
 * Copyright (C) 2008 Analog Devices, Inc
 *
 * Enter bugs at http://blackfin.uclinux.org/
 *
 * Licensed under the GPL-2 or later.
 */

#ifndef __U_AUDIO_H
#define __U_AUDIO_H

#include <linux/device.h>
#include <linux/err.h>
#include <linux/usb/audio.h>
#ifdef CONFIG_USB_SENSE_OVERLAY
#include <linux/usb/composite_sense.h>
#else
#include <linux/usb/composite.h>
#endif

#include <sound/core.h>
#include <sound/pcm.h>
#include <sound/pcm_params.h>

#ifdef CONFIG_USB_SENSE_OVERLAY
#include "gadget_chips_sense.h"
#else
#include "gadget_chips.h"
#endif

/*
 * This represents the USB side of an audio card device, managed by a USB
 * function which provides control and stream interfaces.
 */

struct gaudio_snd_dev {
	struct gaudio			*card;
	struct file			*filp;
	struct snd_pcm_substream	*substream;
	int				access;
	int				format;
	int				channels;
	int				rate;
};

struct gaudio {
	struct usb_function		func;
	struct usb_gadget		*gadget;

	/* ALSA sound device interfaces */
	struct gaudio_snd_dev		control;
	struct gaudio_snd_dev		playback;
	struct gaudio_snd_dev		capture;

	/* TODO */
};

int gaudio_setup(struct gaudio *card);
void gaudio_cleanup(void);

#endif /* __U_AUDIO_H */
