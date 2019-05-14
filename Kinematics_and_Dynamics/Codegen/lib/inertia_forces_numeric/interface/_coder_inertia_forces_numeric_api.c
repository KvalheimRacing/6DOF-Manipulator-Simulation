/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_inertia_forces_numeric_api.c
 *
 * MATLAB Coder version            : 3.3
 * C/C++ source code generated on  : 16-Jul-2018 10:22:09
 */

/* Include Files */
#include "tmwtypes.h"
#include "_coder_inertia_forces_numeric_api.h"
#include "_coder_inertia_forces_numeric_mex.h"

/* Variable Definitions */
emlrtCTX emlrtRootTLSGlobal = NULL;
emlrtContext emlrtContextGlobal = { true,/* bFirstTime */
  false,                               /* bInitialized */
  131450U,                             /* fVersionInfo */
  NULL,                                /* fErrorFunction */
  "inertia_forces_numeric",            /* fFunctionName */
  NULL,                                /* fRTCallStack */
  false,                               /* bDebugMode */
  { 2045744189U, 2170104910U, 2743257031U, 4284093946U },/* fSigWrd */
  NULL                                 /* fSigMem */
};

/* Function Declarations */
static real_T b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId);
static real_T c_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier
  *msgId);
static real_T emlrt_marshallIn(const mxArray *T2, const char_T *identifier);
static const mxArray *emlrt_marshallOut(const real_T u[36]);

/* Function Definitions */

/*
 * Arguments    : const mxArray *u
 *                const emlrtMsgIdentifier *parentId
 * Return Type  : real_T
 */
static real_T b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId)
{
  real_T y;
  y = c_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

/*
 * Arguments    : const mxArray *src
 *                const emlrtMsgIdentifier *msgId
 * Return Type  : real_T
 */
static real_T c_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier
  *msgId)
{
  real_T ret;
  static const int32_T dims = 0;
  emlrtCheckBuiltInR2012b(emlrtRootTLSGlobal, msgId, src, "double", false, 0U,
    &dims);
  ret = *(real_T *)mxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

/*
 * Arguments    : const mxArray *T2
 *                const char_T *identifier
 * Return Type  : real_T
 */
static real_T emlrt_marshallIn(const mxArray *T2, const char_T *identifier)
{
  real_T y;
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = b_emlrt_marshallIn(emlrtAlias(T2), &thisId);
  emlrtDestroyArray(&T2);
  return y;
}

/*
 * Arguments    : const real_T u[36]
 * Return Type  : const mxArray *
 */
static const mxArray *emlrt_marshallOut(const real_T u[36])
{
  const mxArray *y;
  const mxArray *m0;
  static const int32_T iv0[2] = { 0, 0 };

  static const int32_T iv1[2] = { 6, 6 };

  y = NULL;
  m0 = emlrtCreateNumericArray(2, iv0, mxDOUBLE_CLASS, mxREAL);
  mxSetData((mxArray *)m0, (void *)&u[0]);
  emlrtSetDimensions((mxArray *)m0, *(int32_T (*)[2])&iv1[0], 2);
  emlrtAssign(&y, m0);
  return y;
}

/*
 * Arguments    : const mxArray * const prhs[5]
 *                const mxArray *plhs[1]
 * Return Type  : void
 */
void inertia_forces_numeric_api(const mxArray * const prhs[5], const mxArray
  *plhs[1])
{
  real_T (*D)[36];
  real_T T2;
  real_T T3;
  real_T T4;
  real_T T5;
  real_T T6;
  D = (real_T (*)[36])mxMalloc(sizeof(real_T [36]));

  /* Marshall function inputs */
  T2 = emlrt_marshallIn(emlrtAliasP((const mxArray *)prhs[0]), "T2");
  T3 = emlrt_marshallIn(emlrtAliasP((const mxArray *)prhs[1]), "T3");
  T4 = emlrt_marshallIn(emlrtAliasP((const mxArray *)prhs[2]), "T4");
  T5 = emlrt_marshallIn(emlrtAliasP((const mxArray *)prhs[3]), "T5");
  T6 = emlrt_marshallIn(emlrtAliasP((const mxArray *)prhs[4]), "T6");

  /* Invoke the target function */
  inertia_forces_numeric(T2, T3, T4, T5, T6, *D);

  /* Marshall function outputs */
  plhs[0] = emlrt_marshallOut(*D);
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void inertia_forces_numeric_atexit(void)
{
  mexFunctionCreateRootTLS();
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtLeaveRtStackR2012b(emlrtRootTLSGlobal);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
  inertia_forces_numeric_xil_terminate();
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void inertia_forces_numeric_initialize(void)
{
  mexFunctionCreateRootTLS();
  emlrtClearAllocCountR2012b(emlrtRootTLSGlobal, false, 0U, 0);
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void inertia_forces_numeric_terminate(void)
{
  emlrtLeaveRtStackR2012b(emlrtRootTLSGlobal);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/*
 * File trailer for _coder_inertia_forces_numeric_api.c
 *
 * [EOF]
 */
