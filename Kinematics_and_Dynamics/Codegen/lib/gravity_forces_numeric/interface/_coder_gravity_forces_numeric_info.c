/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_gravity_forces_numeric_info.c
 *
 * MATLAB Coder version            : 3.3
 * C/C++ source code generated on  : 23-Jul-2018 13:53:01
 */

/* Include Files */
#include "_coder_gravity_forces_numeric_info.h"

/* Function Definitions */

/*
 * Arguments    : void
 * Return Type  : const mxArray *
 */
const mxArray *emlrtMexFcnResolvedFunctionsInfo()
{
  const mxArray *nameCaptureInfo;
  const char * data[9] = {
    "789ced59c16ed3401075a145f400e484c40555085585a2ac69431b38a54e6812689bd0a6d052a174ed6cda256bafb5b69bb4a772e3c807f001f0077c023fc001"
    "24fe0527f6b6b1552b8644114977a468321eefbed9c9ec8c26234d14d7272449ba2979747dc1e3377c39e1f32b5290c2fa09be3e24739a922603ebb8feb3cf35",
    "6ad8a8657b02c106da707415315730a08eceb6a9511d1bd0b02bc7269218b2283942b58ea68e09aa601dadd12ea1805d415fed529d096d55fb7bf610698d2d47"
    "97d8a1756e2ee916a42eff70c3c3e79f8ce99fcf21590abdc7f57bcfdf659f816d0b310b20cc7003940c9463f808811c6d383a72ddc5c076b10436a94a6dac59",
    "607ba3f832957a2a833c734c13118898fb4a1edb9bc8a4c0468d94bc2883c305f9711a68b486aad0a8551baeab75d85e5fad5356d59863d91a834de22e3d60f0"
    "08dbc76d8586acaae1a232ac25f56e7f9c469cf75a4c7f4c86644ed33e9f093c9dc978fcbecf659f3fcc707bf623f0e2fe3e5723ec49f81a0b1b1d3e28bc6b21",
    "f91ccfd3d4a8a312748ef7a54fbc7c245e50bf575cdbe984609951370ef499f65db1c0fa4a656d45019b6e102d4360534a54da024827806015b88144a00a10a9"
    "3b06703de5864a2f3fc58d9330e7347d9671a4af99d91f2b43c4ebd065c16b45ec1737ee6e47e025427a080bcadb66a3805faf671da228466eb9bc913bb7a3dc",
    "03a7971d52843cacfdc5fd0d5230deee677ad595b87eba13819708e9db85902571bb9a1a90242d0d12c8923ccbf79fe7c314650f278ef7ed1ff1f8fe5b3df0b8"
    "feafe3a4fd99ef780dcc73b78179cf6f7ecc749f633fc2cec1c5cde9dc87af22ef8f7ade979f1496d2d9e69b05596936896c9254eee0441179ffb2e5fd4f11fb",
    "c5f5d38308bc44481fcafbd034c9f1562789ad3a8666636a148d32811a6f3db97d669ff6ddea611fd7d77d2baa876e97e636001cff7b9ff86a0f7cae1f4c5d88"
    "76ab5f26861967bf7ffe127562d4eb44a199cb6eb6d2278b1416d08b553bad95ea4a7e7cea84b8df179f2b5e3c26c7ae7ff8d7ff8944ff7031e724fa87e1e089",
    "fe6130fb8bb94370eef031e2bc71e3782ac21f7cee3017787a2fe3f1599fcff9fc91cfe5a1cd1f34ea0da6c4fca1571feb7a4acc1fc6066f5875c4acb4de2f97"
    "ecf2d2720956b6de5758fe5833c6a88e88fb1ba4ff73fec0b3bc983ffc5dffe0c54cf739f623ec1c60dcdc15fdc3e8e7fd345bb3e02b6d7df78dbabba32aca52",
    "aa7e8044debf74795fcc1f3c12f3078fc4fc6134f0c4fc6130fb8bfb7df1b9466bfe30b8fee172cd1f44ff306e78a27fe86fff3f4424378e",
    "" };

  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(data, 12832U, &nameCaptureInfo);
  return nameCaptureInfo;
}

/*
 * Arguments    : void
 * Return Type  : mxArray *
 */
mxArray *emlrtMexFcnProperties()
{
  mxArray *xResult;
  mxArray *xEntryPoints;
  const char * fldNames[4] = { "Name", "NumberOfInputs", "NumberOfOutputs",
    "ConstantInputs" };

  mxArray *xInputs;
  const char * b_fldNames[4] = { "Version", "ResolvedFunctions", "EntryPoints",
    "CoverageInfo" };

  xEntryPoints = emlrtCreateStructMatrix(1, 1, 4, fldNames);
  xInputs = emlrtCreateLogicalMatrix(1, 4);
  emlrtSetField(xEntryPoints, 0, "Name", mxCreateString("gravity_forces_numeric"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs", mxCreateDoubleScalar(4.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs", mxCreateDoubleScalar(1.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  xResult = emlrtCreateStructMatrix(1, 1, 4, b_fldNames);
  emlrtSetField(xResult, 0, "Version", mxCreateString("9.2.0.556344 (R2017a)"));
  emlrtSetField(xResult, 0, "ResolvedFunctions", (mxArray *)
                emlrtMexFcnResolvedFunctionsInfo());
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

/*
 * File trailer for _coder_gravity_forces_numeric_info.c
 *
 * [EOF]
 */
