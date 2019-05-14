/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_coreolis_and_centrifugal_forces_numeric_api.h
 *
 * MATLAB Coder version            : 3.3
 * C/C++ source code generated on  : 16-Jul-2018 10:39:45
 */

#ifndef _CODER_COREOLIS_AND_CENTRIFUGAL_FORCES_NUMERIC_API_H
#define _CODER_COREOLIS_AND_CENTRIFUGAL_FORCES_NUMERIC_API_H

/* Include Files */
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include <stddef.h>
#include <stdlib.h>
#include "_coder_coreolis_and_centrifugal_forces_numeric_api.h"

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern void coreolis_and_centrifugal_forces_numeric(real_T T2, real_T T3, real_T
  T4, real_T T5, real_T T6, real_T T1d, real_T T2d, real_T T3d, real_T T4d,
  real_T T5d, real_T T6d, real_T C[36]);
extern void coreolis_and_centrifugal_forces_numeric_api(const mxArray * const
  prhs[11], const mxArray *plhs[1]);
extern void coreolis_and_centrifugal_forces_numeric_atexit(void);
extern void coreolis_and_centrifugal_forces_numeric_initialize(void);
extern void coreolis_and_centrifugal_forces_numeric_terminate(void);
extern void coreolis_and_centrifugal_forces_numeric_xil_terminate(void);

#endif

/*
 * File trailer for _coder_coreolis_and_centrifugal_forces_numeric_api.h
 *
 * [EOF]
 */
