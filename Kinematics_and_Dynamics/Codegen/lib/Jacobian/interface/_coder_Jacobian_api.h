/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_Jacobian_api.h
 *
 * MATLAB Coder version            : 3.3
 * C/C++ source code generated on  : 16-Jul-2018 10:33:22
 */

#ifndef _CODER_JACOBIAN_API_H
#define _CODER_JACOBIAN_API_H

/* Include Files */
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include <stddef.h>
#include <stdlib.h>
#include "_coder_Jacobian_api.h"

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern void Jacobian(real_T L2, real_T L3, real_T L4, real_T L5, real_T L6,
                     real_T T1, real_T T2, real_T T3, real_T T4, real_T T5,
                     real_T b_Jacobian[36]);
extern void Jacobian_api(const mxArray * const prhs[10], const mxArray *plhs[1]);
extern void Jacobian_atexit(void);
extern void Jacobian_initialize(void);
extern void Jacobian_terminate(void);
extern void Jacobian_xil_terminate(void);

#endif

/*
 * File trailer for _coder_Jacobian_api.h
 *
 * [EOF]
 */
