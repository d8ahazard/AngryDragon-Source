	.arch armv7-a
	.fpu softvfp
	.eabi_attribute 23, 1
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 1
	.eabi_attribute 18, 4
	.file	"bounds.c"
@ GNU C (GCC) version 4.4.3 (arm-eabi)
@	compiled by GNU C version 4.4.3, GMP version 4.2.4, MPFR version 2.4.1.
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -nostdinc
@ -I/home/digitalhigh/MyDroid/Kernels/AngryDragon1.0/arch/arm/include
@ -Iinclude -Iarch/arm/mach-msm/include -iprefix
@ /home/digitalhigh/MyDroid/toolchains-4.4.3/bin/../lib/gcc/arm-eabi/4.4.3/
@ -D__USES_INITFINI__ -D__KERNEL__ -D__LINUX_ARM_ARCH__=7 -Uarm
@ -DKBUILD_STR(s)=#s -DKBUILD_BASENAME=KBUILD_STR(bounds)
@ -DKBUILD_MODNAME=KBUILD_STR(bounds) -isystem
@ /home/digitalhigh/MyDroid/toolchains-4.4.3/bin/../lib/gcc/arm-eabi/4.4.3/include
@ -include include/generated/autoconf.h -MD kernel/.bounds.s.d
@ kernel/bounds.c -mlittle-endian -marm -mapcs -mno-sched-prolog
@ -mabi=aapcs-linux -mno-thumb-interwork -march=armv7-a -msoft-float
@ -mtune=cortex-a8 -march=armv7-a -mfpu=vfpv3 -auxbase-strip
@ kernel/bounds.s -Os -O1 -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs
@ -Werror-implicit-function-declaration -Wno-format-security
@ -Wframe-larger-than=1024 -Wdeclaration-after-statement -Wno-pointer-sign
@ -fno-strict-aliasing -fno-common -fno-delete-null-pointer-checks
@ -fno-stack-protector -fno-omit-frame-pointer -fno-optimize-sibling-calls
@ -fno-strict-overflow -fconserve-stack -ftree-vectorize -ffast-math
@ -fsingle-precision-constant -fverbose-asm
@ options enabled:  -falign-loops -fargument-alias -fassociative-math
@ -fauto-inc-dec -fbranch-count-reg -fcprop-registers -fcx-limited-range
@ -fdefer-pop -fearly-inlining -feliminate-unused-debug-types
@ -ffinite-math-only -ffunction-cse -fgcse-lm -fguess-branch-probability
@ -fident -fif-conversion -fif-conversion2 -finline
@ -finline-functions-called-once -fipa-pure-const -fipa-reference
@ -fira-share-save-slots -fira-share-spill-slots -fivopts
@ -fkeep-static-consts -fleading-underscore -fmerge-constants
@ -fmerge-debug-strings -fmove-loop-invariants -fpeephole
@ -fpessimistic-inline-stack-limit -freciprocal-math -freg-struct-return
@ -fsched-interblock -fsched-spec -fsched-stalled-insns-dep
@ -fsection-anchors -fsingle-precision-constant -fsplit-ivs-in-unroller
@ -fsplit-wide-types -fstrict-enum-precision -ftoplevel-reorder -ftree-ccp
@ -ftree-ch -ftree-copy-prop -ftree-copyrename -ftree-cselim -ftree-dce
@ -ftree-dominator-opts -ftree-dse -ftree-fre -ftree-loop-im
@ -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
@ -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-sra
@ -ftree-switch-conversion -ftree-ter -ftree-vect-loop-version
@ -ftree-vectorize -funit-at-a-time -funsafe-math-optimizations
@ -fverbose-asm -fzero-initialized-in-bss -mapcs-frame -mlittle-endian

@ Compiler executable checksum: 1aa5637cce51360d1510fab3bccedab6

	.text
	.align	2
	.global	foo
	.type	foo, %function
foo:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp	@,
	stmfd	sp!, {fp, ip, lr, pc}	@,
	sub	fp, ip, #4	@,,
@ 16 "kernel/bounds.c" 1
	
->NR_PAGEFLAGS #23 __NR_PAGEFLAGS	@
@ 0 "" 2
@ 17 "kernel/bounds.c" 1
	
->MAX_NR_ZONES #3 __MAX_NR_ZONES	@
@ 0 "" 2
	ldmfd	sp, {fp, sp, pc}	@
	.size	foo, .-foo
	.ident	"GCC: (GNU) 4.4.3"
	.section	.note.GNU-stack,"",%progbits
