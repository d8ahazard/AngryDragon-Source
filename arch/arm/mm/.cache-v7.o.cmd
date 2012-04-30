cmd_arch/arm/mm/cache-v7.o := /home/digitalhigh/MyDroid/toolchains-4.4.3/bin/arm-eabi-gcc -Wp,-MD,arch/arm/mm/.cache-v7.o.d  -nostdinc -isystem /home/digitalhigh/MyDroid/toolchains-4.4.3/bin/../lib/gcc/arm-eabi/4.4.3/include -I/home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include -Iinclude  -include include/generated/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-msm/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork  -D__LINUX_ARM_ARCH__=7 -march=armv7-a  -include asm/unified.h -msoft-float     -Wa,-march=armv7-a -O1 -mtune=cortex-a8 -ftree-vectorize -ffast-math -fsingle-precision-constant -march=armv7-a -mfpu=vfpv3 -c -o arch/arm/mm/cache-v7.o arch/arm/mm/cache-v7.S

deps_arch/arm/mm/cache-v7.o := \
  arch/arm/mm/cache-v7.S \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/arch/msm7x30.h) \
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
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/unwind.h \
    $(wildcard include/config/arm/unwind.h) \
  arch/arm/mm/proc-macros.S \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/cpu/dcache/writethrough.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/asm-offsets.h \
  include/generated/asm-offsets.h \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/arm/thumbee.h) \
  /home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \

arch/arm/mm/cache-v7.o: $(deps_arch/arm/mm/cache-v7.o)

$(deps_arch/arm/mm/cache-v7.o):
