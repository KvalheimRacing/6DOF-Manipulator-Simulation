/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_coreolis_and_centrifugal_forces_numeric_mex.cpp
 *
 * MATLAB Coder version            : 3.3
 * C/C++ source code generated on  : 16-Jul-2018 10:39:45
 */

/* Include Files */
#include "_coder_coreolis_and_centrifugal_forces_numeric_api.h"
#include "_coder_coreolis_and_centrifugal_forces_numeric_mex.h"

/* Function Declarations */
static void c_coreolis_and_centrifugal_forc(int32_T nlhs, mxArray *plhs[1],
  int32_T nrhs, const mxArray *prhs[11]);

/* Function Definitions */

/*
 * Arguments    : int32_T nlhs
 *                const mxArray *plhs[1]
 *                int32_T nrhs
 *                const mxArray *prhs[11]
 * Return Type  : void
 */
static void c_coreolis_and_centrifugal_forc(int32_T nlhs, mxArray *plhs[1],
  int32_T nrhs, const mxArray *prhs[11])
{
  int32_T n;
  const mxArray *inputs[11];
  const mxArray *outputs[1];
  int32_T b_nlhs;

  /* Check for proper number of arguments. */
  if (nrhs != 11) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal, "EMLRT:runTime:WrongNumberOfInputs",
                        5, 12, 11, 4, 39,
                        "coreolis_and_centrifugal_forces_numeric");
  }

  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal,
                        "EMLRT:runTime:TooManyOutputArguments", 3, 4, 39,
                        "coreolis_and_centrifugal_forces_numeric");
  }

  /* Temporary copy for mex inputs. */
  for (n = 0; n < nrhs; n++) {
    inputs[n] = prhs[n];
  }

  /* Call the function. */
  coreolis_and_centrifugal_forces_numeric_api(inputs, outputs);

  /* Copy over outputs to the caller. */
  if (nlhs < 1) {
    b_nlhs = 1;
  } else {
    b_nlhs = nlhs;
  }

  emlrtReturnArrays(b_nlhs, plhs, outputs);

  /* Module termination. */
  coreolis_and_centrifugal_forces_numeric_terminate();
}

/*
 * Arguments    : int32_T nlhs
 *                const mxArray * const plhs[]
 *                int32_T nrhs
 *                const mxArray * const prhs[]
 * Return Type  : void
 */
void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const mxArray
                 *prhs[])
{
  mexAtExit(coreolis_and_centrifugal_forces_numeric_atexit);

  /* Initialize the memory manager. */
  /* Module initialization. */
  coreolis_and_centrifugal_forces_numeric_initialize();

  /* Dispatch the entry-point. */
  c_coreolis_and_centrifugal_forc(nlhs, plhs, nrhs, prhs);
}

/*
 * Arguments    : void
 * Return Type  : emlrtCTX
 */
emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  return emlrtRootTLSGlobal;
}

/*
 * File trailer for _coder_coreolis_and_centrifugal_forces_numeric_mex.cpp
 *
 * [EOF]
 */
