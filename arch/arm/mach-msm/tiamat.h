/*
 * Copyright (c) 2011, Tiamat. All rights reserved.
 */

#ifndef TIAMAT_H
#define TIAMAT_H

/* PLL calibration limits.
 * The PLL hardware is capable of 384MHz to 1536MHz. The L_VALs
 * used for calibration should respect these limits. */
#define L_VAL_SCPLL_CAL_MIN	0x08	/* =  432 MHz with 27MHz source */
#define L_VAL_SCPLL_CAL_MAX	0x22	/* = 1836 MHz with 27MHz source */

/* Frequency parameters */
#define MAX_AXI			310500	/* KHz */
#define SCPLL_LOW_VDD_FMAX	594000	/* KHz */
#define FREQ_MAX		2052000	/* kHz */

/* Votage parameters */
#define VOLTAGE_MIN		700000	/* uV */
#define VOLTAGE_MAX		1450000	/* uV */
#define SCPLL_LOW_VDD		1000000 /* uV */
#define SCPLL_NOMINAL_VDD	1100000 /* uV */

/* Other parameters */
#define FREQ_TBL_SIZE		35	/* number */

#endif /* TIAMAT_H */
