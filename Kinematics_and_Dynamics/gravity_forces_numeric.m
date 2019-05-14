function G = gravity_forces_numeric(T2,T3,T4,T5)
%GRAVITY_FORCES_NUMERIC
%    G = GRAVITY_FORCES_NUMERIC(T2,T3,T4,T5)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    23-Jul-2018 17:03:23

t2 = sin(T2);
t3 = cos(T2);
t4 = sin(T3);
t5 = cos(T3);
t6 = cos(T4);
t7 = sin(T5);
t8 = cos(T5);
t9 = t2.*t4.*t7.*3.557904569320575e-1;
G = [0.0;t2.*(-2.055066135124532)+t9-t2.*t5.*1.056810509544719-t3.*t4.*1.056810509544719-t2.*t5.*t6.*4.289171658127735e-1-t3.*t4.*t6.*4.289171658127735e-1-t3.*t5.*t7.*3.557904569320575e-1-t2.*t5.*t6.*t8.*3.557904569320575e-1-t3.*t4.*t6.*t8.*3.557904569320575e-1;t9-t2.*t5.*1.056810509544719-t3.*t4.*1.056810509544719-t2.*t5.*t6.*4.289171658127735e-1-t3.*t4.*t6.*4.289171658127735e-1-t3.*t5.*t7.*3.557904569320575e-1-t2.*t5.*t6.*t8.*3.557904569320575e-1-t3.*t4.*t6.*t8.*3.557904569320575e-1;cos(T2+T3).*sin(T4).*(t8.*2.610997660779658e18+3.147644055049096e18).*(-1.362660956294448e-19);t2.*t5.*t8.*(-3.557904569320575e-1)-t3.*t4.*t8.*3.557904569320575e-1+t2.*t4.*t6.*t7.*3.557904569320575e-1-t3.*t5.*t6.*t7.*3.557904569320575e-1;0.0];