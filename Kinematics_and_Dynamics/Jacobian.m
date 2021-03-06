function Jacobian = Jacobian(L2,L3,L4,L5,L6,T1,T2,T3,T4,T5)
%JACOBIAN
%    JACOBIAN = JACOBIAN(L2,L3,L4,L5,L6,T1,T2,T3,T4,T5)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    10-Jul-2018 14:19:39

t2 = sin(T1);
t3 = sin(T5);
t4 = cos(T2);
t5 = cos(T5);
t6 = sin(T3);
t7 = cos(T3);
t8 = cos(T4);
t9 = sin(T2);
t10 = cos(T1);
t11 = sin(T4);
t12 = L5+L6;
t13 = T2+T3;
t14 = t3.*t4.*t6;
t15 = t3.*t7.*t9;
t16 = t5.*t6.*t8.*t9;
t23 = t4.*t5.*t7.*t8;
t17 = t14+t15+t16-t23;
t18 = L3.*t4.*t7;
t19 = cos(t13);
t20 = L4.*t8.*t19;
t21 = sin(t13);
t22 = L2.*t4;
t25 = t12.*t17;
t26 = L3.*t6.*t9;
t24 = t18+t20+t22-t25-t26;
t27 = L5.*t5;
t28 = L6.*t5;
t29 = L4+t27+t28;
t30 = L5.*t3.*t6.*t9;
t31 = L6.*t3.*t6.*t9;
t32 = t2.*t8;
t33 = t4.*t6.*t10.*t11;
t34 = t7.*t9.*t10.*t11;
t35 = t3.*t4.*t7.*t10;
t36 = t4.*t5.*t6.*t8.*t10;
t37 = t5.*t7.*t8.*t9.*t10;
t38 = t35+t36+t37-t2.*t5.*t11-t3.*t6.*t9.*t10;
t39 = t2.*t4.*t6.*t11;
t40 = t2.*t7.*t9.*t11;
t41 = t5.*t10.*t11;
t42 = t2.*t3.*t4.*t7;
t43 = t2.*t4.*t5.*t6.*t8;
t44 = t2.*t5.*t7.*t8.*t9;
t45 = t41+t42+t43+t44-t2.*t3.*t6.*t9;
Jacobian = reshape([-t12.*t45-L2.*t2.*t9-L4.*t10.*t11-L3.*t2.*t4.*t6-L3.*t2.*t7.*t9-L4.*t2.*t8.*t21,t12.*t38-L4.*t2.*t11+L2.*t9.*t10+L3.*t4.*t6.*t10+L3.*t7.*t9.*t10+L4.*t8.*t10.*t21,0.0,0.0,0.0,1.0,t10.*t24,t2.*t24,t30+t31-L2.*t9-L3.*t4.*t6-L3.*t7.*t9-L5.*t3.*t4.*t7-L6.*t3.*t4.*t7-L4.*t4.*t6.*t8-L4.*t7.*t8.*t9-L5.*t4.*t5.*t6.*t8-L6.*t4.*t5.*t6.*t8-L5.*t5.*t7.*t8.*t9-L6.*t5.*t7.*t8.*t9,-t2,t10,0.0,t10.*(t18+t20-t12.*t17-L3.*t6.*t9),t2.*(t18+t20-t25-t26),t30+t31-L3.*t4.*t6-L3.*t7.*t9-L5.*t3.*t4.*t7-L6.*t3.*t4.*t7-L4.*t4.*t6.*t8-L4.*t7.*t8.*t9-L5.*t4.*t5.*t6.*t8-L6.*t4.*t5.*t6.*t8-L5.*t5.*t7.*t8.*t9-L6.*t5.*t7.*t8.*t9,-t2,t10,0.0,-t29.*(t32+t33+t34),-t29.*(t39+t40-t8.*t10),-t11.*t19.*t29,-t10.*t19,-t2.*t19,t21,-t12.*(-t2.*t3.*t11-t4.*t5.*t7.*t10+t5.*t6.*t9.*t10+t3.*t4.*t6.*t8.*t10+t3.*t7.*t8.*t9.*t10),-t12.*(t3.*t10.*t11-t2.*t4.*t5.*t7+t2.*t5.*t6.*t9+t2.*t3.*t4.*t6.*t8+t2.*t3.*t7.*t8.*t9),-t12.*(t4.*t5.*t6+t5.*t7.*t9+t3.*t4.*t7.*t8-t3.*t6.*t8.*t9),-t32-t33-t34,-t39-t40+t8.*t10,-t11.*t19,0.0,0.0,0.0,t38,t45,-t14-t15-t16+t23],[6,6]);
