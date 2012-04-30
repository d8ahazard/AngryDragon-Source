cmd_arch/arm/kernel/entry-common.o := /home/digitalhigh/MyDroid/toolchains-4.4.3/bin/arm-eabi-gcc -Wp,-MD,arch/arm/kernel/.entry-common.o.d  -nostdinc -isystem /home/digitalhigh/MyDroid/toolchains-4.4.3/bin/../lib/gcc/arm-eabi/4.4.3/include -I/home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include -Iinclude  -include include/generated/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-msm/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork  -D__LINUX_ARM_ARCH__=7 -march=armv7-a  -include asm/unified.h -msoft-float      -O1 -mtune=cortex-a8 -ftree-vectorize -ffast-math -fsingle-precision-constant -march=armv7-a -mfpu=vfpv3 -c -o arch/arm/kernel/entry-common.o arch/arm/kernel/entry-common.S

deps_arch/arm/kernel/entry-common.o := \
  arch/arm/kernel/entry-common.S \
    $(wildcard include/config/function/tracer.h) \
    $(wildcard include/config/dynamic/ftrace.h) \
    $(wildcard include/config/cpu/arm710.h) \
    $(wildcard include/config/oabi/compat.h) \
    $(wildcard include/config/arm/thumb.h) \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/aeabi.h) \
    $(wildcard include/config/alignment/trap.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/unistd.h \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/ftrace.h \
    $(wildcard include/config/frame/pointer.h) \
    $(wildcard include/config/arm/unwind.h) \
  arch/arm/mach-msm/include/mach/entry-macro.S \
    $(wildcard include/config/arch/msm8x60.h) \
    $(wildcard include/config/msm/vic.h) \
    $(wildcard include/config/arm/gic.h) \
  arch/arm/mach-msm/include/mach/entry-macro-qgic.S \
    $(wildcard include/config/request/ipi.h) \
  arch/arm/mach-msm/include/mach/hardware.h \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/hardware/gic.h \
  include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/unwind.h \
  arch/arm/kernel/entry-header.S \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/cpu/v6.h) \
  include/linux/init.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/hotplug.h) \
  include/linux/linkage.h \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/linkage.h \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/assembler.h \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/smp.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/ptrace.h \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/hwcap.h \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/asm-offsets.h \
  include/generated/asm-offsets.h \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/errno.h \
  include/asm-generic/errno.h \
  include/asm-generic/errno-base.h \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/arm/thumbee.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  arch/arm/kernel/calls.S \

arch/arm/kernel/entry-common.o: $(deps_arch/arm/kernel/entry-common.o)

$(deps_arch/arm/kernel/entry-common.o):
