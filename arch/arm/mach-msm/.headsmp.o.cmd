cmd_arch/arm/mach-msm/headsmp.o := /home/digitalhigh/MyDroid/toolchains-4.4.3/bin/arm-eabi-gcc -Wp,-MD,arch/arm/mach-msm/.headsmp.o.d  -nostdinc -isystem /home/digitalhigh/MyDroid/toolchains-4.4.3/bin/../lib/gcc/arm-eabi/4.4.3/include -I/home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include -Iinclude  -include include/generated/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-msm/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork  -D__LINUX_ARM_ARCH__=7 -march=armv7-a  -include asm/unified.h -msoft-float      -O1 -mtune=cortex-a8 -ftree-vectorize -ffast-math -fsingle-precision-constant -march=armv7-a -mfpu=vfpv3 -c -o arch/arm/mach-msm/headsmp.o arch/arm/mach-msm/headsmp.S

deps_arch/arm/mach-msm/headsmp.o := \
  arch/arm/mach-msm/headsmp.S \
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

arch/arm/mach-msm/headsmp.o: $(deps_arch/arm/mach-msm/headsmp.o)

$(deps_arch/arm/mach-msm/headsmp.o):
