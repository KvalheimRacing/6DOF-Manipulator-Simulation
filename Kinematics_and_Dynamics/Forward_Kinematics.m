function Forward_Kinematics = Forward_Kinematics(L1,L2,L3,L4,L5,L6,T1,T2,T3,T4,T5,T6)
%FORWARD_KINEMATICS
%    FORWARD_KINEMATICS = FORWARD_KINEMATICS(L1,L2,L3,L4,L5,L6,T1,T2,T3,T4,T5,T6)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    10-Jul-2018 14:19:34

t2 = cos(T1);
t4 = pi.*(1.0./2.0);
t3 = T2-t4;
t5 = cos(T4);
t6 = cos(T3);
t7 = cos(t3);
t8 = sin(T3);
t9 = sin(t3);
t15 = t2.*t6.*t7;
t16 = t2.*t8.*t9;
t10 = t15-t16;
t11 = sin(T1);
t12 = sin(T4);
t13 = T5-t4;
t14 = cos(T6);
t17 = t10.*t12;
t18 = t5.*t11;
t19 = t17+t18;
t20 = sin(T6);
t21 = cos(t13);
t22 = t5.*t10;
t23 = t22-t11.*t12;
t24 = sin(t13);
t25 = t2.*t6.*t9;
t26 = t2.*t7.*t8;
t27 = t25+t26;
t28 = t21.*t23-t24.*t27;
t29 = sin(T5);
t30 = cos(T2);
t31 = cos(T5);
t32 = sin(T2);
t33 = t2.*t6.*t29.*t30;
t34 = t2.*t5.*t8.*t30.*t31;
t35 = t2.*t5.*t6.*t31.*t32;
t36 = t33+t34+t35-t11.*t12.*t31-t2.*t8.*t29.*t32;
t37 = t6.*t7.*t11;
t40 = t8.*t9.*t11;
t38 = t37-t40;
t39 = t2.*t5;
t41 = t39-t12.*t38;
t42 = t2.*t12;
t43 = t5.*t38;
t44 = t42+t43;
t45 = t21.*t44;
t46 = t6.*t9.*t11;
t47 = t7.*t8.*t11;
t48 = t46+t47;
t49 = t45-t24.*t48;
t50 = L5+L6;
t51 = t2.*t12.*t31;
t52 = t6.*t11.*t29.*t30;
t53 = t5.*t8.*t11.*t30.*t31;
t54 = t5.*t6.*t11.*t31.*t32;
t55 = t51+t52+t53+t54-t8.*t11.*t29.*t32;
t56 = T2+T3;
t57 = sin(t56);
t58 = t8.*t30.*t31;
t59 = t6.*t31.*t32;
t60 = t5.*t6.*t29.*t30;
t61 = t58+t59+t60-t5.*t8.*t29.*t32;
t62 = cos(t56);
t63 = t5.*t6.*t30.*t31;
Forward_Kinematics = reshape([t19.*t20+t14.*t28,-t20.*t41+t14.*t49,t14.*t61+t12.*t20.*t62,0.0,t14.*t19-t20.*t28,-t14.*t41-t20.*t49,-t20.*t61+t12.*t14.*t62,0.0,t36,t55,t63-t6.*t29.*t32-t8.*t29.*t30-t5.*t8.*t31.*t32,0.0,t36.*t50-L4.*t11.*t12+L2.*t2.*t32+L3.*t2.*t6.*t32+L3.*t2.*t8.*t30+L4.*t2.*t5.*t57,t50.*t55+L4.*t2.*t12+L2.*t11.*t32+L3.*t6.*t11.*t32+L3.*t8.*t11.*t30+L4.*t5.*t11.*t57,L1+L2.*t30-t50.*(-t63+t6.*t29.*t32+t8.*t29.*t30+t5.*t8.*t31.*t32)+L3.*t6.*t30-L3.*t8.*t32+L4.*t5.*t62,1.0],[4,4]);
