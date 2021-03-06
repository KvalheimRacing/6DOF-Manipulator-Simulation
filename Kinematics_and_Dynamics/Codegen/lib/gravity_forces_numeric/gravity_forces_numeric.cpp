//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: gravity_forces_numeric.cpp
//
// MATLAB Coder version            : 3.3
// C/C++ source code generated on  : 23-Jul-2018 13:53:01
//

// Include Files
#include "rt_nonfinite.h"
#include "gravity_forces_numeric.h"

// Function Definitions

//
// GRAVITY_FORCES_NUMERIC
//     G = GRAVITY_FORCES_NUMERIC(T2,T3,T4,T5)
// Arguments    : double T2
//                double T3
//                double T4
//                double T5
//                double G[6]
// Return Type  : void
//
void gravity_forces_numeric(double T2, double T3, double T4, double T5, double
  G[6])
{
  double t2;
  double t3;
  double t4;
  double t5;
  double t6;
  double t7;
  double t8;
  double t9;

  //     This function was generated by the Symbolic Math Toolbox version 7.2.
  //     23-Jul-2018 13:27:14
  t2 = std::sin(T2);
  t3 = std::cos(T2);
  t4 = std::sin(T3);
  t5 = std::cos(T3);
  t6 = std::cos(T4);
  t7 = std::sin(T5);
  t8 = std::cos(T5);
  t9 = t2 * t4 * t7 * 0.35579045693205752;
  G[0] = 0.0;
  G[1] = (((((((t2 * -2.0550661351245321 + t9) - t2 * t5 * 1.0568105095447189) -
              t3 * t4 * 1.0568105095447189) - t2 * t5 * t6 * 0.4289171658127735)
            - t3 * t4 * t6 * 0.4289171658127735) - t3 * t5 * t7 *
           0.35579045693205752) - t2 * t5 * t6 * t8 * 0.35579045693205752) - t3 *
    t4 * t6 * t8 * 0.35579045693205752;
  G[2] = ((((((t9 - t2 * t5 * 1.0568105095447189) - t3 * t4 * 1.0568105095447189)
             - t2 * t5 * t6 * 0.4289171658127735) - t3 * t4 * t6 *
            0.4289171658127735) - t3 * t5 * t7 * 0.35579045693205752) - t2 * t5 *
          t6 * t8 * 0.35579045693205752) - t3 * t4 * t6 * t8 *
    0.35579045693205752;
  G[3] = std::cos(T2 + T3) * std::sin(T4) * (t8 * 2.6109976607796582E+18 +
    3.1476440550490962E+18) * -1.362660956294448E-19;
  G[4] = ((t2 * t5 * t8 * -0.35579045693205752 - t3 * t4 * t8 *
           0.35579045693205752) + t2 * t4 * t6 * t7 * 0.35579045693205752) - t3 *
    t5 * t6 * t7 * 0.35579045693205752;
  G[5] = 0.0;
}

//
// File trailer for gravity_forces_numeric.cpp
//
// [EOF]
//
