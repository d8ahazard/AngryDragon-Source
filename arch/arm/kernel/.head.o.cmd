cmd_arch/arm/kernel/head.o := /home/digitalhigh/MyDroid/toolchains-4.4.3/bin/arm-eabi-gcc -Wp,-MD,arch/arm/kernel/.head.o.d  -nostdinc -isystem /home/digitalhigh/MyDroid/toolchains-4.4.3/bin/../lib/gcc/arm-eabi/4.4.3/include -I/home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include -Iinclude  -include include/generated/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-msm/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork  -D__LINUX_ARM_ARCH__=7 -march=armv7-a  -include asm/unified.h -msoft-float     -DTEXT_OFFSET=0x00008000 -O1 -mtune=cortex-a8 -ftree-vectorize -ffast-math -fsingle-precision-constant -march=armv7-a -mfpu=vfpv3 -c -o arch/arm/kernel/head.o arch/arm/kernel/head.S

deps_arch/arm/kernel/head.o := \
  arch/arm/kernel/head.S \
    $(wildcard include/config/xip/kernel.h) \
    $(wildcard include/config/xip/phys/addr.h) \
    $(wildcard include/config/smp/parallel/start.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/allow/cpu/alignment.h) \
    $(wildcard include/config/cpu/dcache/disable.h) \
    $(wildcard include/config/cpu/bpredict/disable.h) \
    $(wildcard include/config/cpu/icache/disable.h) \
    $(wildcard include/config/emulate/domain/manager/v7.h) \
    $(wildcard include/config/debug/ll.h) \
    $(wildcard include/config/arch/netwinder.h) \
    $(wildcard include/config/arch/cats.h) \
    $(wildcard include/config/arch/rpc.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  include/linux/linkage.h \
  include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/linkage.h \
  include/linux/init.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/hotplug.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/assembler.h \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/trace/irqflags.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/arm/thumb.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/hwcap.h \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/domain.h \
    $(wildcard include/config/verify/permission/fault.h) \
    $(wildcard include/config/io/36.h) \
    $(wildcard include/config/mmu.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/asm-offsets.h \
  include/generated/asm-offsets.h \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/memory.h \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/discontigmem.h) \
  include/linux/const.h \
  arch/arm/mach-msm/include/mach/memory.h \
    $(wildcard include/config/arch/qsd8x50.h) \
    $(wildcard include/config/arch/msm7225.h) \
    $(wildcard include/config/arch/msm7227.h) \
    $(wildcard include/config/arch/msm7230.h) \
    $(wildcard include/config/mach/vivo.h) \
    $(wildcard include/config/mach/saga.h) \
    $(wildcard include/config/mach/flyer.h) \
    $(wildcard include/config/mach/icon.h) \
    $(wildcard include/config/mach/express/kt.h) \
    $(wildcard include/config/mach/tag.h) \
    $(wildcard include/config/mach/bliss.h) \
    $(wildcard include/config/mach/runnymede.h) \
    $(wildcard include/config/arch/msm7630.h) \
    $(wildcard include/config/mach/mecha.h) \
    $(wildcard include/config/mach/speedy.h) \
    $(wildcard include/config/mach/lexikonct.h) \
    $(wildcard include/config/mach/vivow.h) \
    $(wildcard include/config/mach/express.h) \
    $(wildcard include/config/mach/kingdom.h) \
    $(wildcard include/config/mach/tagh.h) \
    $(wildcard include/config/mach/express/h.h) \
    $(wildcard include/config/mach/blissc.h) \
    $(wildcard include/config/arch/msm8x60.h) \
    $(wildcard include/config/phys/offset.h) \
    $(wildcard include/config/arch/msm7x30.h) \
    $(wildcard include/config/sparsemem.h) \
    $(wildcard include/config/vmsplit/3g.h) \
    $(wildcard include/config/arch/msm/arm11.h) \
    $(wildcard include/config/cache/l2x0.h) \
    $(wildcard include/config/arch/msm/scorpion.h) \
    $(wildcard include/config/arch/msm/scorpionmp.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/sizes.h \
  include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/arm/thumbee.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/system.h \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arch/has/barriers.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/32v6k.h) \
  arch/arm/kernel/head-common.S \

arch/arm/kernel/head.o: $(deps_arch/arm/kernel/head.o)

$(deps_arch/arm/kernel/head.o):
