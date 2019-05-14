/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_gravity_forces_2_numeric_info.c
 *
 * MATLAB Coder version            : 3.3
 * C/C++ source code generated on  : 23-Jul-2018 13:54:21
 */

/* Include Files */
#include "_coder_gravity_forces_2_numeric_info.h"

/* Function Definitions */

/*
 * Arguments    : void
 * Return Type  : const mxArray *
 */
const mxArray *emlrtMexFcnResolvedFunctionsInfo()
{
  const mxArray *nameCaptureInfo;
  const char * data[9] = {
    "789ced594f6fd34a10771f05d1039013d2bba00aa1aa50943525b48153ea8426e1b54d6853fe0aa56b67d32e597badb5dda49ce0f68eef03a0777e7c83f711f8"
    "021c40e2bbe0c4de26b6ba8a215144d21d299a4c269edfec6476469351e6cadb738aa25c5502babc1af02ba19c0af91f4a94e2fa39fe7c4ce67451998f3cc7f5",
    "1f436e50cb451d371008b6d08e67ea88f982054d746aa6414d6c41cbad9dd84861c8a1e418357a9a2626a8864db445078412f605737340752a7455ddf7f92364"
    "b4f63c5361474edf5d32282803f1e18ec7cf3f9f303eff0ae2938ae95f3f7e937f04f61dc41c8030c32d50b15081e163040ab4e599c80f1703fbe50ad8a53a75",
    "b1e180fd9df25f99cc4315149967db8840c4fcaf14b1bb8b6c0a5cd4caa8f75570b4aadecb028336501d5a8d7acb0fb509bbcfd79b94d50de639aec1609bf88f"
    "1e32788cdd93aec2404e7db56ef9b80c1b69b31f8ff782f35e4a188ff998cc6921e48b914f177301bf157235e47772dc9f03015ed2dfe782c09f54a871b0d5e3",
    "e3c2bb1493fb7881a6413d9da03ede7f23e215857851fdebf2d68b5e0a5619f5f3c05cecde15076c6fd4b63634b0eb27d13a042ea544a71d804c0208d6819f48"
    "04ea0091a667013f527ea20c8b53d23c89734e0ba71547f9945bfab23141bc1e9d17bc8ec05ed2bcbb2ec04bc5f41096b457ed56093fdbce7b44d3acc27a75a7",
    "d0f7a33a0467981f8a409e947d797fa314cdb75bb9617d25699cfe14e0a562fa6e236469dceda6162469c78004b234aff2a3d7f93889fce1c4f1feff453c6e7f"
    "6f081ed7ff749e745f2bbda881151e36b012c42dcc99c1731c08fc1c5fdebc5ffef049d6fd69affbea83d25a36df7ebeaa6aed36516d92291cbed364dd3f6f75",
    "ff1f81bda471ba2dc04bc5f4b1ba0f6d9b9cecf58ad8a667192ea656d9aa1268f0d193fb678fe8dfb521fe717d33f4a27ee44f69fe00c0f13f8f88af0fc1e7fa"
    "f1f4057158c33631c93cfbfef59bec13d3de274aed427eb7937d779fc2127ab2e9668d4a532bce4e9f90f7fbec7325cbc7f4cccd0fbffa3f919c1fcee69ce4fc",
    "30193c393f8cc7bedc3b44f70e7f0bce9b348f2f0ae2c1f70ecb914f6fe602be14f2e590df0db93ab1fd834183c594dc3f0c9b63fd48c9fdc3cce04daa8fd8b5"
    "cedbf58a5b5d5bafc0dadedb1a2b9e18d60cf511797fa3f47bee1f789597fb879f9b1f829c193cc781c0cf31e6cd0d393f4c7fddcfb22d073e35b65f3ed75fbe",
    "d0356d2dd33c44b2ee9fbbba2ff70f01c9fd434072ff301d7872ff301efbf27e9f7daee9da3f8c6f7e385ffb07393fcc1a9e9c1f46b3ff03d24738b8",
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
  emlrtSetField(xEntryPoints, 0, "Name", mxCreateString(
    "gravity_forces_2_numeric"));
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
 * File trailer for _coder_gravity_forces_2_numeric_info.c
 *
 * [EOF]
 */
