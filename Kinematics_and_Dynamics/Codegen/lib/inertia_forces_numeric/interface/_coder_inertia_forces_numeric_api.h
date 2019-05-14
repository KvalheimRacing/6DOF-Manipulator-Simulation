/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_inertia_forces_numeric_api.h
 *
 * MATLAB Coder version            : 3.3
 * C/C++ source code generated on  : 16-Jul-2018 10:22:09
 */

#ifndef _CODER_INERTIA_FORCES_NUMERIC_API_H
#define _CODER_INERTIA_FORCES_NUMERIC_API_H

/* Include Files */
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include <stddef.h>
#include <stdlib.h>
#include "_coder_inertia_forces_numeric_api.h"

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern void inertia_forces_numeric(real_T T2, real_T T3, real_T T4, real_T T5,
  real_T T6, real_T D[36]);
extern void inertia_forces_numeric_api(const mxArray * const prhs[5], const
  mxArray *plhs[1]);
extern void inertia_forces_numeric_atexit(void);
extern void inertia_forces_numeric_initialize(void);
extern void inertia_forces_numeric_terminate(void);
extern void inertia_forces_numeric_xil_terminate(void);

#endif

/*
 * File trailer for _coder_inertia_forces_numeric_api.h
 *
 * [EOF]
 */
