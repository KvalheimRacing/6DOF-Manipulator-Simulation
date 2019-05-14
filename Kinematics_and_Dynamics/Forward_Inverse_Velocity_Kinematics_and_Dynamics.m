function [ cart_cord ] = Forward_Inverse_Velocity_Kinematics_and_Dynamics( )

% xx.07.2018
fprintf('\nForwardkinematics, Inversekinematics, velocitykinematics and dynamics for 6DOF Crustcrawler robot, made by Eirik Kvalheim, starting at %s \nAll calculations combined usually takes just over 3min\n', datestr(now,'HH:MM:SS.FFF'))

% Number format
format short % long %

% Number of links
n = 6;

% Tolerance for rounding to 0
tol = 1.e-6;

% Variabels to be used
syms T1 T2 T3 T4 T5 T6 T1d T2d T3d T4d T5d T6d L1 L2 L3 L4 L5 L6 Loff L3d Alpha1 Alpha2 Alpha3 Alpha4 Alpha5 Alpha6 AlphaRho2 AlphaRho3 AlphaRho4 AlphaRho5 AlphaRho6 Theta1 Theta2 Theta3 Theta4 Theta5 Theta6 r11 r12 r13 r21 r22 r23 r31 r32 r33 pxx pyy pzz psii theta phii g Mctr M6L L6c

% Link lengths
Link_lengths = [L1;L2;L3;L4;L5;L6];

% Joint variables
Joint_variables = [T1;T2;T3;T4;T5;T6];

% Joint velocities
Joint_velocities = [T1d;T2d;T3d;T4d;T5d;T6d];


% ----------------------------------------------------------------------%
%                           Forward kinematics                          %
% ----------------------------------------------------------------------%


% DH matrix, syntax - AI(t,a,ai,di)
A1 = AI(T1 + Theta1, Alpha1,  0,    L1);       % Link1
A2 = AI(T2 + Theta2, Alpha2, L2,     0);       % Link2
A3 = AI(T3 + Theta3, Alpha3, L3,     0);       % Link3
A4 = AI(T4 + Theta4, Alpha4, L4,     0);       % Link4
A5 = AI(T5 + Theta5, Alpha5,  0,     0);       % Link5
A6 = AI(T6 + Theta6, Alpha6,  0, L5+L6);       % Link6

Theta1 = 0;
Alpha1 = -pi/2;

Theta2 = -pi/2;
Alpha2 = 0;

Theta3 = 0;
Alpha3 = pi/2;

Theta4 = 0;
Alpha4 = -pi/2;

Theta5 = -pi/2;
Alpha5 = -pi/2;

Theta6 = 0;
Alpha6 = 0;


% For writing out in console
A1_subs = subs(A1)
A2_subs = subs(A2)
A3_subs = subs(A3)
A4_subs = subs(A4)
A5_subs = subs(A5)
A6_subs = subs(A6)


fprintf('Starting Forward Kinematics calculations at %s\n', datestr(now,'HH:MM:SS.FFF'))


% Transformations in symbols
T1in0 = simplify(subs(A1));
T2in0 = simplify(subs(A1*A2));
T3in0 = simplify(subs(A1*A2*A3));
T4in0 = simplify(subs(A1*A2*A3*A4));
T5in0 = simplify(subs(A1*A2*A3*A4*A5));


% Total forward kinematics
Forward_Kinematics = simplify(subs(A1*A2*A3*A4*A5*A6))


% Writing forward kinematics to file
% fprintf('Started writing Forward Kinematics to file %s\n', datestr(now,'HH:MM:SS.FFF'))
% matlabFunction(Forward_Kinematics,'File','Forward_Kinematics.m')
% fprintf('Finished writing Forward Kinematics to file at %s\n', datestr(now,'HH:MM:SS.FFF'))


fprintf('Finished Forward Kinematics, starting Inverse and Velocity Kinematics calculations at %s\n', datestr(now,'HH:MM:SS.FFF'))


% Outputs Point in Base coordinate frame
% cart_cord = Forward_Kinematics(1:3,4);


% Making an array of all rotaion matrices
Rotation_matrices = cell(n,1);
Rotation_matrices{1} = T1in0(1:3,1:3);
Rotation_matrices{2} = T2in0(1:3,1:3);
Rotation_matrices{3} = T3in0(1:3,1:3);
Rotation_matrices{4} = T4in0(1:3,1:3);
Rotation_matrices{5} = T5in0(1:3,1:3);
Rotation_matrices{6} = Forward_Kinematics(1:3,1:3);


% ----------------------------------------------------------------------%
%               Inverse kinematic equations (not complete)              %
% ----------------------------------------------------------------------%


% For matrix equations used in inverse kinematics
T2in1 = simplify(subs(A2));
T3in1 = simplify(subs(A2*A3));
T4in1 = simplify(subs(A2*A3*A4));
T5in1 = simplify(subs(A2*A3*A4*A5));
T6in1 = simplify(subs(A2*A3*A4*A5*A6));

T3in2 = simplify(subs(A3));
T4in2 = simplify(subs(A3*A4));
T5in2 = simplify(subs(A3*A4*A5));
T6in2 = simplify(subs(A3*A4*A5*A6));

T4in3 = simplify(subs(A4));
T5in3 = simplify(subs(A4*A5));
T6in3 = simplify(subs(A4*A5*A6));

T5in4 = simplify(subs(A5));
T6in4 = simplify(subs(A5*A6));

T6in5 = simplify(subs(A6));

T6in0s = [r11, r12, r13, pxx;
          r21, r22, r23, pyy;
          r31, r32, r33, pzz;
            0,   0,   0,  1];


% Calculating inverse matrices (not complete)

% R_trnT1in0 = transpose(T1in0(1:3,1:3));
% D_vecT1in0 = -1*R_trnT1in0*T1in0(1:3,4:4);
%
% T1in0_inv_ = [R_trnT1in0(1,1), R_trnT1in0(1,2), R_trnT1in0(1,3), D_vecT1in0(1,1);
%               R_trnT1in0(2,1), R_trnT1in0(2,2), R_trnT1in0(2,3), D_vecT1in0(2,1);
%               R_trnT1in0(3,1), R_trnT1in0(3,2), R_trnT1in0(3,3), D_vecT1in0(3,1);
%                             0,               0,               0,               1];
%
% R_trnT2in0 = transpose(T2in0(1:3,1:3));
% D_vecT2in0 = -1*R_trnT2in0*T2in0(1:3,4:4);
%
% T2in0_inv_ = [R_trnT2in0(1,1), R_trnT2in0(1,2), R_trnT2in0(1,3), D_vecT2in0(1,1);
%               R_trnT2in0(2,1), R_trnT2in0(2,2), R_trnT2in0(2,3), D_vecT2in0(2,1);
%               R_trnT2in0(3,1), R_trnT2in0(3,2), R_trnT2in0(3,3), D_vecT2in0(3,1);
%                             0,               0,               0,               1];
%
% R_trnT3in0 = transpose(T3in0(1:3,1:3));
% D_vecT3in0 = -1*R_trnT3in0*T3in0(1:3,4:4);
%
% T3in0_inv_ = [R_trnT3in0(1,1), R_trnT3in0(1,2), R_trnT3in0(1,3), D_vecT3in0(1,1);
%               R_trnT3in0(2,1), R_trnT3in0(2,2), R_trnT3in0(2,3), D_vecT3in0(2,1);
%               R_trnT3in0(3,1), R_trnT3in0(3,2), R_trnT3in0(3,3), D_vecT3in0(3,1);
%                             0,               0,               0,               1];
%
%
% Matrise_For_Ligning_1v = simplify(T1in0_inv_*T6in0s);
% Matrise_For_Ligning_1h = simplify(T3in1);
%
% Matrise_For_Ligning_2v = simplify(T2in0_inv_*T6in0s);
% Matrise_For_Ligning_2h = simplify(T3in2);
%
%
% psi = pi/2;
% theta = pi/2;
% phi = 0;
%
% % Definition of RPY matrix
% RPY = [ cos(phi)*cos(theta), -sin(phi)*cos(psi)+cos(phi)*sin(theta)*sin(psi),  sin(phi)*sin(psi)+cos(phi)*sin(theta)*cos(psi);
%         sin(phi)*cos(theta),  cos(phi)*cos(psi)+sin(phi)*sin(theta)*sin(psi), -cos(phi)*sin(psi)+sin(phi)*sin(theta)*cos(psi);
%                 -sin(theta),                             cos(theta)*sin(psi),                             cos(theta)*cos(psi)];
%
%
%
%
% Total_test = simplify(subs(T4in0*RPY))


% ----------------------------------------------------------------------%
%                           Velocity kinematics                         %
% ----------------------------------------------------------------------%


% Gets the symbolic Z vector column of the matrix
z0 = [0;0;1];
z1 = T1in0(1:3,3)
z2 = T2in0(1:3,3)
z3 = T3in0(1:3,3)
z4 = T4in0(1:3,3)
z5 = T5in0(1:3,3)
z6 = Forward_Kinematics(1:3,3)


% Gets the symbolic origin in the respective frame with respect to coordinate frame 0
o0 = [0;0;0];
o1 = T1in0(1:3,4)
o2 = T2in0(1:3,4)
o3 = T3in0(1:3,4)
o4 = T4in0(1:3,4)
o5 = o4 + M6L*z5
o6 = Forward_Kinematics(1:3,4)


% Calculating symbolic cross products of linear velocities, o0 = [0;0;0]
Jv1 = simplify(cross(z0,o6));
Jv2 = simplify(cross(z1,(o6-o1)));
Jv3 = simplify(cross(z2,(o6-o2)));
Jv4 = simplify(cross(z3,(o6-o3)));
Jv5 = simplify(cross(z4,(o6-o4)));
Jv6 = simplify(cross(z5,(o6-o5)));


% The final Jacobian with origins in the center of the revolute axis of the motors
Jacobian = simplify(subs([Jv1, Jv2, Jv3, Jv4, Jv5, Jv6;
                           z0,  z1,  z2,  z3,  z4,  z5]))


% Writing Jacobian to file
% fprintf('Started writing Jacobian to file %s\n', datestr(now,'HH:MM:SS.FFF'))
% matlabFunction(Jacobian,'File','Jacobian.m')
% fprintf('Finished writing Jacobian to file at %s\n', datestr(now,'HH:MM:SS.FFF'))


% Keep in mind that Jvi and Jwi in fomula for kinetic energy is not the same as Jvi and Jwi over, used to make the (first) Jacobian
Jvi = cell(n,1);
Jwi = cell(n,1);
Jvi{6} = Jacobian(1:3,1:6);
Jwi{6} = Jacobian(4:6,1:6);


% Making Jvi and Jwi for formula for kinetic energy
for i = 1:(n-1)

        Jvi{(6-i)} = simplify(subs(subs([Jvi{7-i}(1:3,1:(6-i)) zeros(3,i)],Joint_variables(7-i),0),Link_lengths(7-i),1));
        Jwi{(6-i)} = simplify(subs(subs([Jwi{7-i}(1:3,1:(6-i)) zeros(3,i)],Joint_variables(7-i),0),Link_lengths(7-i),1));

end


fprintf('Finished Velocity Kinematics calculations at %s\n', datestr(now,'HH:MM:SS.FFF'))


% ----------------------------------------------------------------------%
%                     Singularities (not complete)                      %
% ----------------------------------------------------------------------%



% fprintf('Starting multiplication of Jv with Jvt %s\n', datestr(now,'HH:MM:SS.FFF'))
%
% % General symbolic determinant
% JvT = simplify((Jacobian(1:3,1:6)*transpose(Jacobian(1:3,1:6)))); <-- should maybe be other way?
%
% fprintf('Starting calculations of first determinant %s\n', datestr(now,'HH:MM:SS.FFF'))
%
% Determinant = simplify(transpose(factor(det(JvT)))) % this calculation
% took 7 hours and was still not finiched, so something wrong
%
% fprintf('Finish calculations of first determinant, starting writing to file %s\n', datestr(now,'HH:MM:SS.FFF'))
%
% % Writing the Determinant to file
% matlabFunction(Determinant,'File','Determinant.txt')
%
% fprintf('Finish writing to file, starting calculations of total determinant %s\n', datestr(now,'HH:MM:SS.FFF'))
%
% Determinant_total = simplify(transpose(factor(det(Jacobian))))
%
% fprintf('Finish calculations of total determinant, starting writing to file %s\n', datestr(now,'HH:MM:SS.FFF'))
%
% % Writing the total Determinant to file
% matlabFunction(Determinant_total,'File','Determinant_total.txt')
%
% fprintf('Finish writing to file %s\n', datestr(now,'HH:MM:SS.FFF'))


% ----------------------------------------------------------------------%
%                           Velocity Vector                             %
% ----------------------------------------------------------------------%


% Velocities_with_respect_to_base
Zeta = Jacobian*Joint_velocities;


% One velocity vector (squared) with respect to base
Velocity_vector_squared = Zeta(1:3,1).'*Zeta(1:3,1);


% % Writing the velocity vector squared to file
% matlabFunction(Velocity_vector_squared,'File','velocity.txt')
%
% % Writing the velocity vector squared to file
% fid = fopen('Velocity_vector_squared2.txt', 'wt')
% fprintf(fid, '%s\n', char(Velocity_vector_squared))
% fclose(fid)


% ----------------------------------------------------------------------%
%                        Dynamics - Gravity vector                      %
% ----------------------------------------------------------------------%


fprintf('Starting calculations for gravity vectors at %s\n', datestr(now,'HH:MM:SS.FFF'))


% Gets the symbolic x vector column of the matrix
x0 = [1;0;0];
x1 = T1in0(1:3,1);
x2 = T2in0(1:3,1);
x3 = T3in0(1:3,1);
x4 = T4in0(1:3,1);
x5 = T5in0(1:3,1);


% Vector out to center of the mass of the link - measured with motors included
LinkMassCenterMeasured = [         ((o1)-0.0250*z0);                  % Link 1
                                   ((o2)-0.0720*x2);                  % Link 2
                                   ((o3)-0.0405*x3);                  % Link 3
                                   ((o4)-0.0235*x4);                  % Link 4
                                   ((o5)-0.0265*z5);                  % Link 5
                                       o5 + L6c*z6];                  % Link 6


% Measured weight of each link in kg, including all motors, screws, brackets, cables etc. This is for the 6DOF CC for TEK4030, set tek4030:=true in crustcrawler_simulation when opening gazebo, to see the configuration.
% These weights are measured very thoroughly and accurately, and should be the weights used in any calculations on the crustcrawler robot.
% If you are looking for mass of the link with pen, you can find that where the integrals are calculated (line 1551 or 991).
Link_masses = [0.3833;                                                % Link 1
               0.2724;                                                % Link 2
               0.2323;                                                % Link 3
               0.1821;                                                % Link 4
               0.1433;                                                % Link 5
               0.2280];                                               % Link 6



% Vector out to center of the mass in the link (assuming in the middle)
lc = [        ((o1)/2);         % Link 1
      o1 + ((o2-o1)/2);         % Link 2
      o2 + ((o3-o2)/2);         % Link 3
      o3 + ((o4-o3)/2);         % Link 4
      o4 + ((L5)/2)*z5;         % Link 5
      o5 + L6c*z5];             % Link 6


% Vector out to each motor, each center is represented by three rows
mc = [                  o0;     % Motor 1
                o1-Mctr*z0;     % Motor 2
                o2-Mctr*x2;     % Motor 3
                o3-Mctr*x3;     % Motor 4
                o4-Mctr*x4;     % Motor 5
                        o5];    % Motor 6


% Vector with masses of the links
m_l = sym('m_l', [n,1]);


% Vector with masses of the motors
m_m = sym('m_m', [n,1]);


% Vector for the gravitational force in initial/base frame
g_in0 = [ 0;
          0;
         -g];


% Defining potential energy, calculating in two ways, one based on measurements, and one bassed on calculations and splitting up the masses
potential_energy = 0;
potential_energy_measured = 0;


% Summing up the potential energy
for i = 1:n
    potential_energy = potential_energy + (m_l(i)*g_in0.'*lc(1+(3*(i-1)):3*i) + m_m(i)*g_in0.'*mc(1+(3*(i-1)):3*i));
    potential_energy_measured = potential_energy_measured + (Link_masses(i)*g_in0.'*LinkMassCenterMeasured(1+(3*(i-1)):3*i));
end


% % Conversion ratio from 1 oz to x kg
% crt = 0.02834952313


% Substituting lenght variables
Mctr = 0.0150; % Length from rotation axis to motor center
M6L  = 0.0825; % Lenght from motor 5 (o4) to edge of motor 6 (o5)
L6c  = 0.0490; % Length from start of link 6 out to center of mass of link 6


% Gravity vector at Kjeller, used http://www.ptb.de/cartoweb3/SISproject.php
g = 9.819007; % +- 0.000196 (95% uncertanty)


% Substituting masses of links
m_l1 = 0.0850485694; % kg - roughly estimated 3oz, not accurate at all, but not very important <--- this is wrong, it's MX-64AT -% 41,9g on round plate
m_l2 = 0.1580777996; % kg - long girder + single axis adapter plate short + dual axis adapter plate (long) + 2x brackets ++
m_l3 = 0.0917961845; % kg - small girder + two single axis adapter plates <---- OBS! this is wrong .26oz on single axisplate
m_l4 = 0.0350971390; % kg
m_l5 = 0.0350971390; % kg
m_l6 = 0.1871068530; % kg


% http://support.robotis.com/en/product/actuator/dynamixel/mx_series/mx-64at_ar.htm

% Substituting masses of motors
m_m1 = 0.0771107029; % kg - this is not essential beeing in the base
m_m2 = 0.2698874600; % kg - two Dynamixel MX-64AT Servos
m_m3 = 0.1349437300; % kg
m_m4 = 0.1349437300; % kg
m_m5 = 0.1349437300; % kg
m_m6 = 0.1275728540; % kg - includes red brackets, black spacer and two angle brackets


% Substituting link lengths
L1 = 0.1080; % m
L2 = 0.2200; % m
L3 = 0.1565; % m
L4 = 0.0910; % m
L5 = 0.0630; % m
L6 = 0.1650; % m


% Substituting changed variables
potential_energy = simplify(subs(-potential_energy));
potential_energy_measured = simplify(subs(-potential_energy_measured));


% Getting the gravity vector by partialdifferenting P with respect to q
% This gravity vector is not as accurate as the one below and should not be used.
% It also includes somewhat wrong masses on some of the links. Not fixed because measured approach is better.
G = simplify([ diff(potential_energy,T1);
               diff(potential_energy,T2);
               diff(potential_energy,T3);
               diff(potential_energy,T4);
               diff(potential_energy,T5);
               diff(potential_energy,T6)])


% Getting the gravity vector based on measured parameters, differenting P with respect to q
G2 = simplify([diff(potential_energy_measured,T1);
               diff(potential_energy_measured,T2);
               diff(potential_energy_measured,T3);
               diff(potential_energy_measured,T4);
               diff(potential_energy_measured,T5);
               diff(potential_energy_measured,T6)])


fprintf('Finished calculations for gravity vectors at %s, starting computing inertia tensors\n', datestr(now,'HH:MM:SS.FFF'))


% Writing gravity vector to file
fprintf('Started writing gravitational forces to file %s\n', datestr(now,'HH:MM:SS.FFF'))
matlabFunction(G,'File','gravity_forces_numeric.m')
fprintf('Finished writing gravitational forces to file at %s\n', datestr(now,'HH:MM:SS.FFF'))


% Writing gravity vector2 to file
fprintf('Started writing alternative gravitational forces to file %s\n', datestr(now,'HH:MM:SS.FFF'))
matlabFunction(G2,'File','gravity_forces_2_numeric.m')
fprintf('Finished writing alternative gravitational forces to file at %s\n', datestr(now,'HH:MM:SS.FFF'))


% ----------------------------------------------------------------------%
%                        Dynamics - Inertia Matrix                      %
% ----------------------------------------------------------------------%


% Since the axis of Link i frame does not coincide with the central axes of inertia, the
% inertia products are not necessarily null and the inertia tensor relative to the centre of mass
% is a 3x3 matrix with possible numeric values in each element.
% These integrals can be found on page 252 in spong and are calculated below.
% You can find the dimmensions (a, b and c) for each link below, as in example 7.2 on page 253 in spong


% Since the motor is a part of the link, and not a separate mass attached to the link, we are including the weight and dimensions of the motor in the link.
% Here we have dissasembled each link, measured the weight and found the center of gravity.
% With that means the place on the link where the masses are balanced, i.e that you can balance the link on your finger, at that point.
% Mass density is then (in the second approach) calculated below by using weight and volume (for constant rho inertial tensors).
% There are two approaches to calculating the inertia here. The second assumes that the density is constant, when in fact it's not,
% and moves the center of mass for the integral, which leads to seemingly odd inertial numbers.

% In the first approach the function alpha/(sqrt(x^2+y^2+z^2)+1) is introduced as a simple model for a decreasing mass density,
% leading to more reasonable numbers. See attached document for proof/description of function.
density_func = @(x,y,z) 1./(sqrt(x.^2+y.^2+z.^2)+1.);
% This approach is the most accurate and it turnes out that the simplification is infact the real density function, or a function very close to it. See picture of derivation on whiteboard.

% All joints are modelled as rectangular solids with non uniform massdistribution where we specify the mass center. This is important because of the big
% weight difference between the link part and the motor part of the link, making the center of mass far away from the center of the link.


% The b dimensions here is not the same as the link lengths because each motor sticks out approx 15mm after the rotational axis. This exstended length
% is important to account for when calculating the inertia matrix, but is not to be used to link lenght, meaning bLx != Lx.


% The inertia tensors relates to the axis cross of the previous link i.e L1 is described in z0, y0, x0 and L2 is described in z1, y1, x1 etc


% ----------------------------------------------------------------------%
%                First approach - With density function                 %
% ----------------------------------------------------------------------%


% Cell array for inertia tensors with density function, meaning non uniform mass distribution. If manual checking is needed, http://www.wolframalpha.com/widgets/view.jsp?id=a2d7bfcef89ab3b9ee282f39793f1edd is a good widget
Inertia_tensors_density_func = cell(n,1);


% Dimensions (in m) and mass density (in kg/m^3) for link 1
aL1 = 0.0300;                                             % Mass center gives integral limits from -0.0150m to 0.0150m (a/2)    x0
bL1 = 0.1150;                                             % Mass center gives integral limits from -0.0572m to 0.0572m (b/2)    y0
cL1 = 0.0700;                                             % Mass center gives integral limits from -0.0450m to 0.0250m          z0
xminL1 = -0.0150;                                         % Limit given by description over
xmaxL1 =  0.0150;                                         % Limit given by description over
yminL1 = -0.0572;                                         % Limit given by description over
ymaxL1 =  0.0572;                                         % Limit given by description over
zminL1 = -0.0450;                                         % Limit given by description over
zmaxL1 =  0.0250;                                         % Limit given by description over


% Constant for the density function
AlphaRho1 = Link_masses(1)/(integral3(density_func,xminL1,xmaxL1,yminL1,ymaxL1,zminL1,zmaxL1)*aL1*bL1*cL1); % 6.857785354705372e+06


% Integral function for Ixx of Link1
integral_func_Ixx_L1 = @(x,y,z) (y.^2+z.^2)*AlphaRho1./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Iyy of Link1
integral_func_Iyy_L1 = @(x,y,z) (x.^2+z.^2)*AlphaRho1./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Izz of Link1
integral_func_Izz_L1 = @(x,y,z) (x.^2+y.^2)*AlphaRho1./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Ixy of Link1
integral_func_Ixy_L1 = @(x,y,z) -1.*x.*y.*AlphaRho1./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Ixz of Link1
integral_func_Ixz_L1 = @(x,y,z) -1.*x.*z.*AlphaRho1./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Iyz of Link1
integral_func_Iyz_L1 = @(x,y,z) -1.*y.*z.*AlphaRho1./(sqrt(x.^2+y.^2+z.^2)+1.);


% Calculating Ixx of L1
Ixx_L1 = (integral3(integral_func_Ixx_L1,xminL1,xmaxL1,yminL1,ymaxL1,zminL1,zmaxL1));


% Calculating Iyy of L1
Iyy_L1 = (integral3(integral_func_Iyy_L1,xminL1,xmaxL1,yminL1,ymaxL1,zminL1,zmaxL1));


% Calculating Izz of L1
Izz_L1 = (integral3(integral_func_Izz_L1,xminL1,xmaxL1,yminL1,ymaxL1,zminL1,zmaxL1));


% Calculating Ixy of L1
Ixy_L1 = (integral3(integral_func_Ixy_L1,xminL1,xmaxL1,yminL1,ymaxL1,zminL1,zmaxL1));


% Calculating Ixz of L1
Ixz_L1 = (integral3(integral_func_Ixz_L1,xminL1,xmaxL1,yminL1,ymaxL1,zminL1,zmaxL1));


% Calculating Ixz of L1
Iyz_L1 = (integral3(integral_func_Iyz_L1,xminL1,xmaxL1,yminL1,ymaxL1,zminL1,zmaxL1));


% Inertia tensor for link 1 - rectangular prism with density function specific to this link
Inertia_tensors_density_func{1} = [ Ixx_L1, Ixy_L1, Ixz_L1;
                                    Ixy_L1, Iyy_L1, Iyz_L1;
                                    Ixz_L1, Iyz_L1, Izz_L1];


% Removing all factors less then the tolerance
Inertia_tensors_density_func{1}(Inertia_tensors_density_func{1} < 0 & Inertia_tensors_density_func{1} > -tol) = 0;
Inertia_tensors_density_func{1}(Inertia_tensors_density_func{1} > 0 & Inertia_tensors_density_func{1} < tol) = 0;


% Printing out I1
I1 = Inertia_tensors_density_func{1}


% Dimensions (in m) and mass density (in kg/m^3) for link 2
aL2 = 0.0350;                                             % Mass center gives integral limits from -0.0175m to 0.0175m (a/2)    x1
bL2 = 0.2330;                                             % Mass center gives integral limits from -0.1460m to 0.0870m          y1
cL2 = 0.0600;                                             % Mass center gives integral limits from -0.0300m to 0.0300m (c/2)    z1
xminL2 = -0.0175;                                         % Limit given by description over
xmaxL2 =  0.0175;                                         % Limit given by description over
yminL2 = -0.1460;                                         % Limit given by description over
ymaxL2 =  0.0870;                                         % Limit given by description over
zminL2 = -0.0300;                                         % Limit given by description over
zmaxL2 =  0.0300;                                         % Limit given by description over


% Constant for the density function
AlphaRho2 = Link_masses(2)/(integral3(density_func,xminL2,xmaxL2,yminL2,ymaxL2,zminL2,zmaxL2)*aL2*bL2*cL2); % 1.212389024274977e+06


% Integral function for Ixx of Link2
integral_func_Ixx_L2 = @(x,y,z) (y.^2+z.^2)*AlphaRho2./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Iyy of Link2
integral_func_Iyy_L2 = @(x,y,z) (x.^2+z.^2)*AlphaRho2./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Izz of Link2
integral_func_Izz_L2 = @(x,y,z) (x.^2+y.^2)*AlphaRho2./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Ixy of Link2
integral_func_Ixy_L2 = @(x,y,z) -1.*x.*y.*AlphaRho2./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Ixz of Link2
integral_func_Ixz_L2 = @(x,y,z) -1.*x.*z.*AlphaRho2./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Iyz of Link2
integral_func_Iyz_L2 = @(x,y,z) -1.*y.*z.*AlphaRho2./(sqrt(x.^2+y.^2+z.^2)+1.);


% Calculating Ixx of L2
Ixx_L2 = (integral3(integral_func_Ixx_L2,xminL2,xmaxL2,yminL2,ymaxL2,zminL2,zmaxL2));


% Calculating Iyy of L2
Iyy_L2 = (integral3(integral_func_Iyy_L2,xminL2,xmaxL2,yminL2,ymaxL2,zminL2,zmaxL2));


% Calculating Izz of L2
Izz_L2 = (integral3(integral_func_Izz_L2,xminL2,xmaxL2,yminL2,ymaxL2,zminL2,zmaxL2));


% Calculating Ixy of L2
Ixy_L2 = (integral3(integral_func_Ixy_L2,xminL2,xmaxL2,yminL2,ymaxL2,zminL2,zmaxL2));


% Calculating Ixz of L2
Ixz_L2 = (integral3(integral_func_Ixz_L2,xminL2,xmaxL2,yminL2,ymaxL2,zminL2,zmaxL2));


% Calculating Ixz of L2
Iyz_L2 = (integral3(integral_func_Iyz_L2,xminL2,xmaxL2,yminL2,ymaxL2,zminL2,zmaxL2));


% Inertia tensor for link 2, with density function specific to this link
Inertia_tensors_density_func{2} = [ Ixx_L2, Ixy_L2, Ixz_L2;
                                    Ixy_L2, Iyy_L2, Iyz_L2;
                                    Ixz_L2, Iyz_L2, Izz_L2];


% Removing all factors less then the tolerance
Inertia_tensors_density_func{2}(Inertia_tensors_density_func{2} < 0 & Inertia_tensors_density_func{2} > -tol) = 0;
Inertia_tensors_density_func{2}(Inertia_tensors_density_func{2} > 0 & Inertia_tensors_density_func{2} < tol) = 0;


% Printing out I2
I2 = Inertia_tensors_density_func{2}


% Dimensions (in m) and mass density (in kg/m^3) for link 3
aL3 = 0.1690;                                             % Mass center gives integral limits from -0.1130m to 0.0560m          x2
bL3 = 0.0400;                                             % Mass center gives integral limits from -0.0200m to 0.0200m (b/2)    y2
cL3 = 0.0400;                                             % Mass center gives integral limits from -0.0200m to 0.0200m (c/2)    z2
xminL3 = -0.1130;                                         % Limit given by description over
xmaxL3 =  0.0560;                                         % Limit given by description over
yminL3 = -0.0200;                                         % Limit given by description over
ymaxL3 =  0.0200;                                         % Limit given by description over
zminL3 = -0.0200;                                         % Limit given by description over
zmaxL3 =  0.0200;                                         % Limit given by description over


% Constant for the density function
AlphaRho3 = Link_masses(3)/(integral3(density_func,xminL3,xmaxL3,yminL3,ymaxL3,zminL3,zmaxL3)*aL3*bL3*cL3); % 3.337589674504087e+06


% Integral function for Ixx of Link3
integral_func_Ixx_L3 = @(x,y,z) (y.^2+z.^2)*AlphaRho3./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Iyy of Link3
integral_func_Iyy_L3 = @(x,y,z) (x.^2+z.^2)*AlphaRho3./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Izz of Link3
integral_func_Izz_L3 = @(x,y,z) (x.^2+y.^2)*AlphaRho3./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Ixy of Link3
integral_func_Ixy_L3 = @(x,y,z) -1.*x.*y.*AlphaRho3./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Ixz of Link3
integral_func_Ixz_L3 = @(x,y,z) -1.*x.*z.*AlphaRho3./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Iyz of Link3
integral_func_Iyz_L3 = @(x,y,z) -1.*y.*z.*AlphaRho3./(sqrt(x.^2+y.^2+z.^2)+1.);


% Calculating Ixx of L3
Ixx_L3 = (integral3(integral_func_Ixx_L3,xminL3,xmaxL3,yminL3,ymaxL3,zminL3,zmaxL3));


% Calculating Iyy of L3
Iyy_L3 = (integral3(integral_func_Iyy_L3,xminL3,xmaxL3,yminL3,ymaxL3,zminL3,zmaxL3));


% Calculating Izz of L3
Izz_L3 = (integral3(integral_func_Izz_L3,xminL3,xmaxL3,yminL3,ymaxL3,zminL3,zmaxL3));


% Calculating Ixy of L3
Ixy_L3 = (integral3(integral_func_Ixy_L3,xminL3,xmaxL3,yminL3,ymaxL3,zminL3,zmaxL3));


% Calculating Ixz of L3
Ixz_L3 = (integral3(integral_func_Ixz_L3,xminL3,xmaxL3,yminL3,ymaxL3,zminL3,zmaxL3));


% Calculating Ixz of L3
Iyz_L3 = (integral3(integral_func_Iyz_L3,xminL3,xmaxL3,yminL3,ymaxL3,zminL3,zmaxL3));


% Inertia tensor for link 3, with density function specific to this link
Inertia_tensors_density_func{3} = [ Ixx_L3, Ixy_L3, Ixz_L3;
                                    Ixy_L3, Iyy_L3, Iyz_L3;
                                    Ixz_L3, Iyz_L3, Izz_L3];


% Removing all factors less then the tolerance
Inertia_tensors_density_func{3}(Inertia_tensors_density_func{3} < 0 & Inertia_tensors_density_func{3} > -tol) = 0;
Inertia_tensors_density_func{3}(Inertia_tensors_density_func{3} > 0 & Inertia_tensors_density_func{3} < tol) = 0;


% Printing out I3
I3 = Inertia_tensors_density_func{3}


% Dimensions (in m) and mass density (in kg/m^3) for link 4
aL4 = 0.1030;                                             % Mass center gives integral limits from -0.0655m to 0.0375m          x3
bL4 = 0.0400;                                             % Mass center gives integral limits from -0.0200m to 0.0200m (b/2)    y3
cL4 = 0.0400;                                             % Mass center gives integral limits from -0.0200m to 0.0200m (c/2)    z3
xminL4 = -0.0655;                                         % Limit given by description over
xmaxL4 =  0.0375;                                         % Limit given by description over
yminL4 = -0.0200;                                         % Limit given by description over
ymaxL4 =  0.0200;                                         % Limit given by description over
zminL4 = -0.0200;                                         % Limit given by description over
zmaxL4 =  0.0200;                                         % Limit given by description over


% Constant for the density function
AlphaRho4 = Link_masses(4)/(integral3(density_func,xminL4,xmaxL4,yminL4,ymaxL4,zminL4,zmaxL4)*aL4*bL4*cL4); % 4.292824748458674e+06


% Integral function for Ixx of Link4
integral_func_Ixx_L4 = @(x,y,z) (y.^2+z.^2)*AlphaRho4./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Iyy of Link4
integral_func_Iyy_L4 = @(x,y,z) (x.^2+z.^2)*AlphaRho4./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Izz of Link4
integral_func_Izz_L4 = @(x,y,z) (x.^2+y.^2)*AlphaRho4./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Ixy of Link4
integral_func_Ixy_L4 = @(x,y,z) -1.*x.*y.*AlphaRho4./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Ixz of Link4
integral_func_Ixz_L4 = @(x,y,z) -1.*x.*z.*AlphaRho4./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Iyz of Link4
integral_func_Iyz_L4 = @(x,y,z) -1.*y.*z.*AlphaRho4./(sqrt(x.^2+y.^2+z.^2)+1.);


% Calculating Ixx of L4
Ixx_L4 = (integral3(integral_func_Ixx_L4,xminL4,xmaxL4,yminL4,ymaxL4,zminL4,zmaxL4));


% Calculating Iyy of L4
Iyy_L4 = (integral3(integral_func_Iyy_L4,xminL4,xmaxL4,yminL4,ymaxL4,zminL4,zmaxL4));


% Calculating Izz of L4
Izz_L4 = (integral3(integral_func_Izz_L4,xminL4,xmaxL4,yminL4,ymaxL4,zminL4,zmaxL4));


% Calculating Ixy of L4
Ixy_L4 = (integral3(integral_func_Ixy_L4,xminL4,xmaxL4,yminL4,ymaxL4,zminL4,zmaxL4));


% Calculating Ixz of L4
Ixz_L4 = (integral3(integral_func_Ixz_L4,xminL4,xmaxL4,yminL4,ymaxL4,zminL4,zmaxL4));


% Calculating Ixz of L4
Iyz_L4 = (integral3(integral_func_Iyz_L4,xminL4,xmaxL4,yminL4,ymaxL4,zminL4,zmaxL4));


% Inertia tensor for link 4, with density function specific to this link
Inertia_tensors_density_func{4} = [ Ixx_L4, Ixy_L4, Ixz_L4;
                                    Ixy_L4, Iyy_L4, Iyz_L4;
                                    Ixz_L4, Iyz_L4, Izz_L4];


% Removing all factors less then the tolerance
Inertia_tensors_density_func{4}(Inertia_tensors_density_func{4} < 0 & Inertia_tensors_density_func{4} > -tol) = 0;
Inertia_tensors_density_func{4}(Inertia_tensors_density_func{4} > 0 & Inertia_tensors_density_func{4} < tol) = 0;


% Printing out I4
I4 = Inertia_tensors_density_func{4}


% Dimensions (in m) and mass density (in kg/m^3) for link 5
aL5 = 0.0825;                                             % Mass center gives integral limits from -0.0560m to 0.0265m          x4
bL5 = 0.0500;                                             % Mass center gives integral limits from -0.0250m to 0.0250m (b/2)    y4
cL5 = 0.0500;                                             % Mass center gives integral limits from -0.0280m to 0.0220m          z4
xminL5 = -0.0560;                                         % Limit given by description over
xmaxL5 =  0.0265;                                         % Limit given by description over
yminL5 = -0.0250;                                         % Limit given by description over
ymaxL5 =  0.0250;                                         % Limit given by description over
zminL5 = -0.0280;                                         % Limit given by description over
zmaxL5 =  0.0220;                                         % Limit given by description over


% Constant for the density function
AlphaRho5 = Link_masses(5)/(integral3(density_func,xminL5,xmaxL5,yminL5,ymaxL5,zminL5,zmaxL5)*aL5*bL5*cL5); % 3.477085359877383e+06


% Integral function for Ixx of Link5
integral_func_Ixx_L5 = @(x,y,z) (y.^2+z.^2)*AlphaRho5./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Iyy of Link5
integral_func_Iyy_L5 = @(x,y,z) (x.^2+z.^2)*AlphaRho5./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Izz of Link5
integral_func_Izz_L5 = @(x,y,z) (x.^2+y.^2)*AlphaRho5./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Ixy of Link5
integral_func_Ixy_L5 = @(x,y,z) -1.*x.*y.*AlphaRho5./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Ixz of Link5
integral_func_Ixz_L5 = @(x,y,z) -1.*x.*z.*AlphaRho5./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Iyz of Link5
integral_func_Iyz_L5 = @(x,y,z) -1.*y.*z.*AlphaRho5./(sqrt(x.^2+y.^2+z.^2)+1.);


% Calculating Ixx of L5
Ixx_L5 = (integral3(integral_func_Ixx_L5,xminL5,xmaxL5,yminL5,ymaxL5,zminL5,zmaxL5));


% Calculating Iyy of L5
Iyy_L5 = (integral3(integral_func_Iyy_L5,xminL5,xmaxL5,yminL5,ymaxL5,zminL5,zmaxL5));


% Calculating Izz of L5
Izz_L5 = (integral3(integral_func_Izz_L5,xminL5,xmaxL5,yminL5,ymaxL5,zminL5,zmaxL5));


% Calculating Ixy of L5
Ixy_L5 = (integral3(integral_func_Ixy_L5,xminL5,xmaxL5,yminL5,ymaxL5,zminL5,zmaxL5));


% Calculating Ixz of L5
Ixz_L5 = (integral3(integral_func_Ixz_L5,xminL5,xmaxL5,yminL5,ymaxL5,zminL5,zmaxL5));


% Calculating Ixz of L5
Iyz_L5 = (integral3(integral_func_Iyz_L5,xminL5,xmaxL5,yminL5,ymaxL5,zminL5,zmaxL5));


% Inertia tensor for link 5, with density function specific to this link
Inertia_tensors_density_func{5} = [ Ixx_L5, Ixy_L5, Ixz_L5;
                                    Ixy_L5, Iyy_L5, Iyz_L5;
                                    Ixz_L5, Iyz_L5, Izz_L5];


% Removing all factors less then the tolerance
Inertia_tensors_density_func{5}(Inertia_tensors_density_func{5} < 0 & Inertia_tensors_density_func{5} > -tol) = 0;
Inertia_tensors_density_func{5}(Inertia_tensors_density_func{5} > 0 & Inertia_tensors_density_func{5} < tol) = 0;


% Printing out I5
I5 = Inertia_tensors_density_func{5}


% Dimensions (in m) and mass density (in kg/m^3) for link 6
aL6 = 0.0700;                                             % Mass center gives integral limits from -0.0350m to 0.0350m (a/2)    x5
bL6 = 0.0400;                                             % Mass center gives integral limits from -0.0200m to 0.0200m (b/2)    y5
cL6 = 0.1650;                                             % Mass center gives integral limits from -0.0490m to 0.1160m          z5
xminL6 = -0.0350;                                         % Limit given by description over
xmaxL6 =  0.0350;                                         % Limit given by description over
yminL6 = -0.0200;                                         % Limit given by description over
ymaxL6 =  0.0200;                                         % Limit given by description over
zminL6 = -0.0490;                                         % Limit given by description over
zmaxL6 =  0.1160;                                         % Limit given by description over


% Constant for the density function
AlphaRho6 = Link_masses(6)/(integral3(density_func,xminL6,xmaxL6,yminL6,ymaxL6,zminL6,zmaxL6)*aL6*bL6*cL6); % 1.126592938205009e+06


% Integral function for Ixx of Link6
integral_func_Ixx_L6 = @(x,y,z) (y.^2+z.^2)*AlphaRho6./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Iyy of Link6
integral_func_Iyy_L6 = @(x,y,z) (x.^2+z.^2)*AlphaRho6./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Izz of Link6
integral_func_Izz_L6 = @(x,y,z) (x.^2+y.^2)*AlphaRho6./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Ixy of Link6
integral_func_Ixy_L6 = @(x,y,z) -1.*x.*y.*AlphaRho6./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Ixz of Link6
integral_func_Ixz_L6 = @(x,y,z) -1.*x.*z.*AlphaRho6./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Iyz of Link6
integral_func_Iyz_L6 = @(x,y,z) -1.*y.*z.*AlphaRho6./(sqrt(x.^2+y.^2+z.^2)+1.);


% Calculating Ixx of L6
Ixx_L6 = (integral3(integral_func_Ixx_L6,xminL6,xmaxL6,yminL6,ymaxL6,zminL6,zmaxL6));


% Calculating Iyy of L6
Iyy_L6 = (integral3(integral_func_Iyy_L6,xminL6,xmaxL6,yminL6,ymaxL6,zminL6,zmaxL6));


% Calculating Izz of L6
Izz_L6 = (integral3(integral_func_Izz_L6,xminL6,xmaxL6,yminL6,ymaxL6,zminL6,zmaxL6));


% Calculating Ixy of L6
Ixy_L6 = (integral3(integral_func_Ixy_L6,xminL6,xmaxL6,yminL6,ymaxL6,zminL6,zmaxL6));


% Calculating Ixz of L6
Ixz_L6 = (integral3(integral_func_Ixz_L6,xminL6,xmaxL6,yminL6,ymaxL6,zminL6,zmaxL6));


% Calculating Ixz of L6
Iyz_L6 = (integral3(integral_func_Iyz_L6,xminL6,xmaxL6,yminL6,ymaxL6,zminL6,zmaxL6));


% Inertia tensor for link 6, with density function specific to this link
Inertia_tensors_density_func{6} = [ Ixx_L6, Ixy_L6, Ixz_L6;
                                    Ixy_L6, Iyy_L6, Iyz_L6;
                                    Ixz_L6, Iyz_L6, Izz_L6];


% Removing all factors less then the tolerance
Inertia_tensors_density_func{6}(Inertia_tensors_density_func{6} < 0 & Inertia_tensors_density_func{6} > -tol) = 0;
Inertia_tensors_density_func{6}(Inertia_tensors_density_func{6} > 0 & Inertia_tensors_density_func{6} < tol) = 0;


% Printing out I6
I6 = Inertia_tensors_density_func{6}


% Dimensions (in m) and mass density (in kg/m^3) for pen link (if needed in future as other type of endeffector, not used in current config)
Link_with_pen_mass = 0.1406;                              % Pen included
aLp = 0.2000;                                             % Mass center gives integral limits from -0.1030m to 0.0970m          x2
bLp = 0.0330;                                             % Mass center gives integral limits from -0.0165m to 0.0165m (b/2)    y2
cLp = 0.0330;                                             % Mass center gives integral limits from -0.0165m to 0.0165m (c/2)    z2
xminLp = -0.1030;                                         % Limit given by description over
xmaxLp =  0.0970;                                         % Limit given by description over
yminLp = -0.0165;                                         % Limit given by description over
ymaxLp =  0.0165;                                         % Limit given by description over
zminLp = -0.0165;                                         % Limit given by description over
zmaxLp =  0.0165;                                         % Limit given by description over


% Constant for the density function
AlphaRho_p = Link_with_pen_mass/(integral3(density_func,xminLp,xmaxLp,yminLp,ymaxLp,zminLp,zmaxLp)*aLp*bLp*cLp); % 3.118535200039031e+06


% Integral function for Ixx of pen Link
integral_func_Ixx_Lp = @(x,y,z) (y.^2+z.^2)*AlphaRho_p./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Iyy of pen Link
integral_func_Iyy_Lp = @(x,y,z) (x.^2+z.^2)*AlphaRho_p./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Izz of pen Link
integral_func_Izz_Lp = @(x,y,z) (x.^2+y.^2)*AlphaRho_p./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Ixy of pen Link
integral_func_Ixy_Lp = @(x,y,z) -1.*x.*y.*AlphaRho_p./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Ixz of pen Link
integral_func_Ixz_Lp = @(x,y,z) -1.*x.*z.*AlphaRho_p./(sqrt(x.^2+y.^2+z.^2)+1.);


% Integral function for Iyz of pen Link
integral_func_Iyz_Lp = @(x,y,z) -1.*y.*z.*AlphaRho_p./(sqrt(x.^2+y.^2+z.^2)+1.);


% Calculating Ixx of Lp
Ixx_Lp = (integral3(integral_func_Ixx_Lp,xminLp,xmaxLp,yminLp,ymaxLp,zminLp,zmaxLp));


% Calculating Iyy of Lp
Iyy_Lp = (integral3(integral_func_Iyy_Lp,xminLp,xmaxLp,yminLp,ymaxLp,zminLp,zmaxLp));


% Calculating Izz of Lp
Izz_Lp = (integral3(integral_func_Izz_Lp,xminLp,xmaxLp,yminLp,ymaxLp,zminLp,zmaxLp));


% Calculating Ixy of Lp
Ixy_Lp = (integral3(integral_func_Ixy_Lp,xminLp,xmaxLp,yminLp,ymaxLp,zminLp,zmaxLp));


% Calculating Ixz of Lp
Ixz_Lp = (integral3(integral_func_Ixz_Lp,xminLp,xmaxLp,yminLp,ymaxLp,zminLp,zmaxLp));


% Calculating Ixz of Lp
Iyz_Lp = (integral3(integral_func_Iyz_Lp,xminLp,xmaxLp,yminLp,ymaxLp,zminLp,zmaxLp));


% Inertia tensor for pen link, with density function specific to this link
Inertia_tensors_density_func_pen = [ Ixx_Lp, Ixy_Lp, Ixz_Lp;
                                     Ixy_Lp, Iyy_Lp, Iyz_Lp;
                                     Ixz_Lp, Iyz_Lp, Izz_Lp];


% Removing all factors less then the tolerance
Inertia_tensors_density_func_pen(Inertia_tensors_density_func_pen < 0 & Inertia_tensors_density_func_pen > -tol) = 0;
Inertia_tensors_density_func_pen(Inertia_tensors_density_func_pen > 0 & Inertia_tensors_density_func_pen < tol) = 0


% ----------------------------------------------------------------------%
%               Second approach - With constant density                 %
% ----------------------------------------------------------------------%


% Now we are calculating the same integrals, only with a simplification that the density is constant, and an assumption that the center of mass is in the middle of the link.
% This shows substantionally different results compared to the use of the density function, primarly because of that the assumption over (about the center of mass in the middle) does not hold.


% Cell array for inertia tensors with constant rho
Inertia_tensors_constant_rho = cell(n,1);


% Dimensions (in m) and mass density (in kg/m^3) for link 1
aL1 = 0.0300;                                             % Mass center gives integral limits from -0.0150m to 0.0150m (a/2)    x0
bL1 = 0.1150;                                             % Mass center gives integral limits from -0.0572m to 0.0572m (b/2)    y0
cL1 = 0.0700;                                             % Mass center gives integral limits from -0.0350m to 0.0350m (c/2)    z0
xminL1 = -0.0150;                                         % Limit given by description over
xmaxL1 =  0.0150;                                         % Limit given by description over
yminL1 = -0.0572;                                         % Limit given by description over
ymaxL1 =  0.0572;                                         % Limit given by description over
zminL1 = -0.0350;                                         % Limit given by description over
zmaxL1 =  0.0350;                                         % Limit given by description over
ConstRho1 = Link_masses(1)/(aL1*bL1*cL1);                 % 1.587163561076604e+03


% Integral function for Ixx of Link1
integral_func_Ixx_L1 = @(x,y,z) (y.^2+z.^2)*ConstRho1;


% Integral function for Iyy of Link1
integral_func_Iyy_L1 = @(x,y,z) (x.^2+z.^2)*ConstRho1;


% Integral function for Izz of Link1
integral_func_Izz_L1 = @(x,y,z) (x.^2+y.^2)*ConstRho1;


% Integral function for Ixy of Link1
integral_func_Ixy_L1 = @(x,y,z) -1.*x.*y.*ConstRho1;


% Integral function for Ixz of Link1
integral_func_Ixz_L1 = @(x,y,z) -1.*x.*z.*ConstRho1;


% Integral function for Iyz of Link1
integral_func_Iyz_L1 = @(x,y,z) -1.*y.*z.*ConstRho1;


% Calculating Ixx of L1
Ixx_L1 = (integral3(integral_func_Ixx_L1,xminL1,xmaxL1,yminL1,ymaxL1,zminL1,zmaxL1));


% Calculating Iyy of L1
Iyy_L1 = (integral3(integral_func_Iyy_L1,xminL1,xmaxL1,yminL1,ymaxL1,zminL1,zmaxL1));


% Calculating Izz of L1
Izz_L1 = (integral3(integral_func_Izz_L1,xminL1,xmaxL1,yminL1,ymaxL1,zminL1,zmaxL1));


% Calculating Ixy of L1
Ixy_L1 = (integral3(integral_func_Ixy_L1,xminL1,xmaxL1,yminL1,ymaxL1,zminL1,zmaxL1));


% Calculating Ixz of L1
Ixz_L1 = (integral3(integral_func_Ixz_L1,xminL1,xmaxL1,yminL1,ymaxL1,zminL1,zmaxL1));


% Calculating Ixz of L1
Iyz_L1 = (integral3(integral_func_Iyz_L1,xminL1,xmaxL1,yminL1,ymaxL1,zminL1,zmaxL1));


% Inertia tensor for link 1 - rectangular prism with density function specific to this link
Inertia_tensors_constant_rho{1} = [ Ixx_L1, Ixy_L1, Ixz_L1;
                                    Ixy_L1, Iyy_L1, Iyz_L1;
                                    Ixz_L1, Iyz_L1, Izz_L1];


% Removing all factors less then the tolerance
Inertia_tensors_constant_rho{1}(Inertia_tensors_constant_rho{1} < 0 & Inertia_tensors_constant_rho{1} > -tol) = 0;
Inertia_tensors_constant_rho{1}(Inertia_tensors_constant_rho{1} > 0 & Inertia_tensors_constant_rho{1} < tol) = 0;


% Printing out I1
I1 = Inertia_tensors_constant_rho{1}


% Although we model the first link geometrically as a pism/box, we can also model the first joint/link as a hollow cylinder (tube) with the following dimmensions:
% Inner radius r1 = 0.0150m
% Outer radius r2 = 0.0572m
% And height h = 0.070m (because this is the the hight of the part that is rotating, the rest of the 108mm high Link 1 is not rotating, thus would be wrong to include)
% Then use the calculator here;
% https://www.amesweb.info/SectionalPropertiesTabs/Mass-Moment-Inertia-Hollow-Cylinder-Shaft.aspx
% Keep in mind that there is a big simplification here that the mass is uniform.
% That is not the case, and the mass center in z0 direction is o1-25mm.
% Beeing the first joint closest to the base, a simplification of modelling Link 1 as a uniform solid cylindrical tube is maybe good enough.
% Inertia tensor for link 1 - cylindrical tube with uniform mass distribution - units is in kg*m^2

% Inertia_tensors_constant_rho{1} = [ 0.00049200,             0,             0;
%                                              0,      0.000492,             0;
%                                              0,             0,      0.00067];


% Dimensions (in m) and mass density (in kg/m^3) for link 2
aL2 = 0.0350;                                             % Mass center gives integral limits from -0.0175m to 0.0175m (a/2)    x1
bL2 = 0.2330;                                             % Mass center gives integral limits from -0.1165m to 0.1165m (b/2)    y1
cL2 = 0.0600;                                             % Mass center gives integral limits from -0.0300m to 0.0300m (c/2)    z1
xminL2 = -0.0175;                                         % Limit given by description over
xmaxL2 =  0.0175;                                         % Limit given by description over
yminL2 = -0.1165;                                         % Limit given by description over
ymaxL2 =  0.1165;                                         % Limit given by description over
zminL2 = -0.0300;                                         % Limit given by description over
zmaxL2 =  0.0300;                                         % Limit given by description over
ConstRho2 = Link_masses(2)/(aL2*bL2*cL2);                 % 5.567136725935009e+02


% Integral function for Ixx of Link2
integral_func_Ixx_L2 = @(x,y,z) (y.^2+z.^2)*ConstRho2;


% Integral function for Iyy of Link2
integral_func_Iyy_L2 = @(x,y,z) (x.^2+z.^2)*ConstRho2;


% Integral function for Izz of Link2
integral_func_Izz_L2 = @(x,y,z) (x.^2+y.^2)*ConstRho2;


% Integral function for Ixy of Link2
integral_func_Ixy_L2 = @(x,y,z) -1.*x.*y.*ConstRho2;


% Integral function for Ixz of Link2
integral_func_Ixz_L2 = @(x,y,z) -1.*x.*z.*ConstRho2;


% Integral function for Iyz of Link2
integral_func_Iyz_L2 = @(x,y,z) -1.*y.*z.*ConstRho2;


% Calculating Ixx of L2
Ixx_L2 = (integral3(integral_func_Ixx_L2,xminL2,xmaxL2,yminL2,ymaxL2,zminL2,zmaxL2));


% Calculating Iyy of L2
Iyy_L2 = (integral3(integral_func_Iyy_L2,xminL2,xmaxL2,yminL2,ymaxL2,zminL2,zmaxL2));


% Calculating Izz of L2
Izz_L2 = (integral3(integral_func_Izz_L2,xminL2,xmaxL2,yminL2,ymaxL2,zminL2,zmaxL2));


% Calculating Ixy of L2
Ixy_L2 = (integral3(integral_func_Ixy_L2,xminL2,xmaxL2,yminL2,ymaxL2,zminL2,zmaxL2));


% Calculating Ixz of L2
Ixz_L2 = (integral3(integral_func_Ixz_L2,xminL2,xmaxL2,yminL2,ymaxL2,zminL2,zmaxL2));


% Calculating Ixz of L2
Iyz_L2 = (integral3(integral_func_Iyz_L2,xminL2,xmaxL2,yminL2,ymaxL2,zminL2,zmaxL2));


% Inertia tensor for link 2, with density function specific to this link
Inertia_tensors_constant_rho{2} = [ Ixx_L2, Ixy_L2, Ixz_L2;
                                    Ixy_L2, Iyy_L2, Iyz_L2;
                                    Ixz_L2, Iyz_L2, Izz_L2];


% Removing all factors less then the tolerance
Inertia_tensors_constant_rho{2}(Inertia_tensors_constant_rho{2} < 0 & Inertia_tensors_constant_rho{2} > -tol) = 0;
Inertia_tensors_constant_rho{2}(Inertia_tensors_constant_rho{2} > 0 & Inertia_tensors_constant_rho{2} < tol) = 0;


% Printing out I2
I2 = Inertia_tensors_constant_rho{2}


% Dimensions (in m) and mass density (in kg/m^3) for link 3
aL3 = 0.1690;                                             % Mass center gives integral limits from -0.0845m to 0.0845m (a/2)    x2
bL3 = 0.0400;                                             % Mass center gives integral limits from -0.0200m to 0.0200m (b/2)    y2
cL3 = 0.0400;                                             % Mass center gives integral limits from -0.0200m to 0.0200m (c/2)    z2
xminL3 = -0.0845;                                         % Limit given by description over
xmaxL3 =  0.0845;                                         % Limit given by description over
yminL3 = -0.0200;                                         % Limit given by description over
ymaxL3 =  0.0200;                                         % Limit given by description over
zminL3 = -0.0200;                                         % Limit given by description over
zmaxL3 =  0.0200;                                         % Limit given by description over
ConstRho3 = Link_masses(3)/(aL3*bL3*cL3);                 % 8.590976331360946e+02

% Integral function for Ixx of Link3
integral_func_Ixx_L3 = @(x,y,z) (y.^2+z.^2)*ConstRho3;


% Integral function for Iyy of Link3
integral_func_Iyy_L3 = @(x,y,z) (x.^2+z.^2)*ConstRho3;


% Integral function for Izz of Link3
integral_func_Izz_L3 = @(x,y,z) (x.^2+y.^2)*ConstRho3;


% Integral function for Ixy of Link3
integral_func_Ixy_L3 = @(x,y,z) -1.*x.*y.*ConstRho3;


% Integral function for Ixz of Link3
integral_func_Ixz_L3 = @(x,y,z) -1.*x.*z.*ConstRho3;


% Integral function for Iyz of Link3
integral_func_Iyz_L3 = @(x,y,z) -1.*y.*z.*ConstRho3;


% Calculating Ixx of L3
Ixx_L3 = (integral3(integral_func_Ixx_L3,xminL3,xmaxL3,yminL3,ymaxL3,zminL3,zmaxL3));


% Calculating Iyy of L3
Iyy_L3 = (integral3(integral_func_Iyy_L3,xminL3,xmaxL3,yminL3,ymaxL3,zminL3,zmaxL3));


% Calculating Izz of L3
Izz_L3 = (integral3(integral_func_Izz_L3,xminL3,xmaxL3,yminL3,ymaxL3,zminL3,zmaxL3));


% Calculating Ixy of L3
Ixy_L3 = (integral3(integral_func_Ixy_L3,xminL3,xmaxL3,yminL3,ymaxL3,zminL3,zmaxL3));


% Calculating Ixz of L3
Ixz_L3 = (integral3(integral_func_Ixz_L3,xminL3,xmaxL3,yminL3,ymaxL3,zminL3,zmaxL3));


% Calculating Ixz of L3
Iyz_L3 = (integral3(integral_func_Iyz_L3,xminL3,xmaxL3,yminL3,ymaxL3,zminL3,zmaxL3));


% Inertia tensor for link 3, with density function specific to this link
Inertia_tensors_constant_rho{3} = [ Ixx_L3, Ixy_L3, Ixz_L3;
                                    Ixy_L3, Iyy_L3, Iyz_L3;
                                    Ixz_L3, Iyz_L3, Izz_L3];


% Removing all factors less then the tolerance
Inertia_tensors_constant_rho{3}(Inertia_tensors_constant_rho{3} < 0 & Inertia_tensors_constant_rho{3} > -tol) = 0;
Inertia_tensors_constant_rho{3}(Inertia_tensors_constant_rho{3} > 0 & Inertia_tensors_constant_rho{3} < tol) = 0;


% Printing out I3
I3 = Inertia_tensors_constant_rho{3}


% Dimensions (in m) and mass density (in kg/m^3) for link 4
aL4 = 0.1030;                                             % Mass center gives integral limits from -0.0515m to 0.0515m (a/2)    x3
bL4 = 0.0400;                                             % Mass center gives integral limits from -0.0200m to 0.0200m (b/2)    y3
cL4 = 0.0400;                                             % Mass center gives integral limits from -0.0200m to 0.0200m (c/2)    z3
xminL4 = -0.0515;                                         % Limit given by description over
xmaxL4 =  0.0515;                                         % Limit given by description over
yminL4 = -0.0200;                                         % Limit given by description over
ymaxL4 =  0.0200;                                         % Limit given by description over
zminL4 = -0.0200;                                         % Limit given by description over
zmaxL4 =  0.0200;                                         % Limit given by description over
ConstRho4 = Link_masses(4)/(aL4*bL4*cL4);                 % 1.104975728155340e+03


% Integral function for Ixx of Link4
integral_func_Ixx_L4 = @(x,y,z) (y.^2+z.^2)*ConstRho4;


% Integral function for Iyy of Link4
integral_func_Iyy_L4 = @(x,y,z) (x.^2+z.^2)*ConstRho4;


% Integral function for Izz of Link4
integral_func_Izz_L4 = @(x,y,z) (x.^2+y.^2)*ConstRho4;


% Integral function for Ixy of Link4
integral_func_Ixy_L4 = @(x,y,z) -1.*x.*y.*ConstRho4;


% Integral function for Ixz of Link4
integral_func_Ixz_L4 = @(x,y,z) -1.*x.*z.*ConstRho4;


% Integral function for Iyz of Link4
integral_func_Iyz_L4 = @(x,y,z) -1.*y.*z.*ConstRho4;


% Calculating Ixx of L4
Ixx_L4 = (integral3(integral_func_Ixx_L4,xminL4,xmaxL4,yminL4,ymaxL4,zminL4,zmaxL4));


% Calculating Iyy of L4
Iyy_L4 = (integral3(integral_func_Iyy_L4,xminL4,xmaxL4,yminL4,ymaxL4,zminL4,zmaxL4));


% Calculating Izz of L4
Izz_L4 = (integral3(integral_func_Izz_L4,xminL4,xmaxL4,yminL4,ymaxL4,zminL4,zmaxL4));


% Calculating Ixy of L4
Ixy_L4 = (integral3(integral_func_Ixy_L4,xminL4,xmaxL4,yminL4,ymaxL4,zminL4,zmaxL4));


% Calculating Ixz of L4
Ixz_L4 = (integral3(integral_func_Ixz_L4,xminL4,xmaxL4,yminL4,ymaxL4,zminL4,zmaxL4));


% Calculating Ixz of L4
Iyz_L4 = (integral3(integral_func_Iyz_L4,xminL4,xmaxL4,yminL4,ymaxL4,zminL4,zmaxL4));


% Inertia tensor for link 4, with density function specific to this link
Inertia_tensors_constant_rho{4} = [ Ixx_L4, Ixy_L4, Ixz_L4;
                                    Ixy_L4, Iyy_L4, Iyz_L4;
                                    Ixz_L4, Iyz_L4, Izz_L4];


% Removing all factors less then the tolerance
Inertia_tensors_constant_rho{4}(Inertia_tensors_constant_rho{4} < 0 & Inertia_tensors_constant_rho{4} > -tol) = 0;
Inertia_tensors_constant_rho{4}(Inertia_tensors_constant_rho{4} > 0 & Inertia_tensors_constant_rho{4} < tol) = 0;


% Printing out I4
I4 = Inertia_tensors_constant_rho{4}


% Dimensions (in m) and mass density (in kg/m^3) for link 5
aL5 = 0.0825;                                             % Mass center gives integral limits from -0.0412m to 0.0412m (a/2)    x4
bL5 = 0.0500;                                             % Mass center gives integral limits from -0.0250m to 0.0250m (b/2)    y4
cL5 = 0.0500;                                             % Mass center gives integral limits from -0.0250m to 0.0250m (c/2)    z4
xminL5 = -0.0412;                                         % Limit given by description over
xmaxL5 =  0.0412;                                         % Limit given by description over
yminL5 = -0.0250;                                         % Limit given by description over
ymaxL5 =  0.0250;                                         % Limit given by description over
zminL5 = -0.0250;                                         % Limit given by description over
zmaxL5 =  0.0250;                                         % Limit given by description over
ConstRho5 = Link_masses(5)/(aL5*bL5*cL5);                 % 6.947878787878788e+02


% Integral function for Ixx of Link5
integral_func_Ixx_L5 = @(x,y,z) (y.^2+z.^2)*ConstRho5;


% Integral function for Iyy of Link5
integral_func_Iyy_L5 = @(x,y,z) (x.^2+z.^2)*ConstRho5;


% Integral function for Izz of Link5
integral_func_Izz_L5 = @(x,y,z) (x.^2+y.^2)*ConstRho5;


% Integral function for Ixy of Link5
integral_func_Ixy_L5 = @(x,y,z) -1.*x.*y.*ConstRho5;


% Integral function for Ixz of Link5
integral_func_Ixz_L5 = @(x,y,z) -1.*x.*z.*ConstRho5;


% Integral function for Iyz of Link5
integral_func_Iyz_L5 = @(x,y,z) -1.*y.*z.*ConstRho5;


% Calculating Ixx of L5
Ixx_L5 = (integral3(integral_func_Ixx_L5,xminL5,xmaxL5,yminL5,ymaxL5,zminL5,zmaxL5));


% Calculating Iyy of L5
Iyy_L5 = (integral3(integral_func_Iyy_L5,xminL5,xmaxL5,yminL5,ymaxL5,zminL5,zmaxL5));


% Calculating Izz of L5
Izz_L5 = (integral3(integral_func_Izz_L5,xminL5,xmaxL5,yminL5,ymaxL5,zminL5,zmaxL5));


% Calculating Ixy of L5
Ixy_L5 = (integral3(integral_func_Ixy_L5,xminL5,xmaxL5,yminL5,ymaxL5,zminL5,zmaxL5));


% Calculating Ixz of L5
Ixz_L5 = (integral3(integral_func_Ixz_L5,xminL5,xmaxL5,yminL5,ymaxL5,zminL5,zmaxL5));


% Calculating Ixz of L5
Iyz_L5 = (integral3(integral_func_Iyz_L5,xminL5,xmaxL5,yminL5,ymaxL5,zminL5,zmaxL5));


% Inertia tensor for link 5, with density function specific to this link
Inertia_tensors_constant_rho{5} = [ Ixx_L5, Ixy_L5, Ixz_L5;
                                    Ixy_L5, Iyy_L5, Iyz_L5;
                                    Ixz_L5, Iyz_L5, Izz_L5];


% Removing all factors less then the tolerance
Inertia_tensors_constant_rho{5}(Inertia_tensors_constant_rho{5} < 0 & Inertia_tensors_constant_rho{5} > -tol) = 0;
Inertia_tensors_constant_rho{5}(Inertia_tensors_constant_rho{5} > 0 & Inertia_tensors_constant_rho{5} < tol) = 0;


% Printing out I5
I5 = Inertia_tensors_constant_rho{5}


% Dimensions (in m) and mass density (in kg/m^3) for link 6
aL6 = 0.0700;                                             % Mass center gives integral limits from -0.0350m to 0.0350m (a/2)    x5
bL6 = 0.0400;                                             % Mass center gives integral limits from -0.0200m to 0.0200m (b/2)    y5
cL6 = 0.1650;                                             % Mass center gives integral limits from -0.0825m to 0.0825m (c/2)    z5
xminL6 = -0.0350;                                         % Limit given by description over
xmaxL6 =  0.0350;                                         % Limit given by description over
yminL6 = -0.0200;                                         % Limit given by description over
ymaxL6 =  0.0200;                                         % Limit given by description over
zminL6 = -0.0825;                                         % Limit given by description over
zmaxL6 =  0.0825;                                         % Limit given by description over
ConstRho6 = Link_masses(6)/(aL6*bL6*cL6);                 % 493.5065


% Integral function for Ixx of Link6
integral_func_Ixx_L6 = @(x,y,z) (y.^2+z.^2)*ConstRho6;


% Integral function for Iyy of Link6
integral_func_Iyy_L6 = @(x,y,z) (x.^2+z.^2)*ConstRho6;


% Integral function for Izz of Link6
integral_func_Izz_L6 = @(x,y,z) (x.^2+y.^2)*ConstRho6;


% Integral function for Ixy of Link6
integral_func_Ixy_L6 = @(x,y,z) -1.*x.*y.*ConstRho6;


% Integral function for Ixz of Link6
integral_func_Ixz_L6 = @(x,y,z) -1.*x.*z.*ConstRho6;


% Integral function for Iyz of Link6
integral_func_Iyz_L6 = @(x,y,z) -1.*y.*z.*ConstRho6;


% Calculating Ixx of L6
Ixx_L6 = (integral3(integral_func_Ixx_L6,xminL6,xmaxL6,yminL6,ymaxL6,zminL6,zmaxL6));


% Calculating Iyy of L6
Iyy_L6 = (integral3(integral_func_Iyy_L6,xminL6,xmaxL6,yminL6,ymaxL6,zminL6,zmaxL6));


% Calculating Izz of L6
Izz_L6 = (integral3(integral_func_Izz_L6,xminL6,xmaxL6,yminL6,ymaxL6,zminL6,zmaxL6));


% Calculating Ixy of L6
Ixy_L6 = (integral3(integral_func_Ixy_L6,xminL6,xmaxL6,yminL6,ymaxL6,zminL6,zmaxL6));


% Calculating Ixz of L6
Ixz_L6 = (integral3(integral_func_Ixz_L6,xminL6,xmaxL6,yminL6,ymaxL6,zminL6,zmaxL6));


% Calculating Ixz of L6
Iyz_L6 = (integral3(integral_func_Iyz_L6,xminL6,xmaxL6,yminL6,ymaxL6,zminL6,zmaxL6));


% Inertia tensor for link 6, with density function specific to this link
Inertia_tensors_constant_rho{6} = [ Ixx_L6, Ixy_L6, Ixz_L6;
                                    Ixy_L6, Iyy_L6, Iyz_L6;
                                    Ixz_L6, Iyz_L6, Izz_L6];


% Removing all factors less then the tolerance
Inertia_tensors_constant_rho{6}(Inertia_tensors_constant_rho{6} < 0 & Inertia_tensors_constant_rho{6} > -tol) = 0;
Inertia_tensors_constant_rho{6}(Inertia_tensors_constant_rho{6} > 0 & Inertia_tensors_constant_rho{6} < tol) = 0;


% Printing out I6
I6 = Inertia_tensors_constant_rho{6}


% Dimensions (in m) and mass density (in kg/m^3) for pen link (if needed in future as other type of endeffector, not used in current config)
Link_with_pen_mass = 0.1406;                              % Pen included
aLp = 0.2000;                                             % Mass center gives integral limits from -0.1000m to 0.1000m (a/2)    x2
bLp = 0.0330;                                             % Mass center gives integral limits from -0.0165m to 0.0165m (b/2)    y2
cLp = 0.0330;                                             % Mass center gives integral limits from -0.0165m to 0.0165m (c/2)    z2
xminLp = -0.1000;                                         % Limit given by description over
xmaxLp =  0.1000;                                         % Limit given by description over
yminLp = -0.0165;                                         % Limit given by description over
ymaxLp =  0.0165;                                         % Limit given by description over
zminLp = -0.0165;                                         % Limit given by description over
zmaxLp =  0.0165;                                         % Limit given by description over
ConstRho_p = Link_with_pen_mass/(aLp*bLp*cLp);            % 645.5464


% Integral function for Ixx of pen Link
integral_func_Ixx_Lp = @(x,y,z) (y.^2+z.^2)*ConstRho_p;


% Integral function for Iyy of pen Link
integral_func_Iyy_Lp = @(x,y,z) (x.^2+z.^2)*ConstRho_p;


% Integral function for Izz of pen Link
integral_func_Izz_Lp = @(x,y,z) (x.^2+y.^2)*ConstRho_p;


% Integral function for Ixy of pen Link
integral_func_Ixy_Lp = @(x,y,z) -1.*x.*y.*ConstRho_p;


% Integral function for Ixz of pen Link
integral_func_Ixz_Lp = @(x,y,z) -1.*x.*z.*ConstRho_p;


% Integral function for Iyz of pen Link
integral_func_Iyz_Lp = @(x,y,z) -1.*y.*z.*ConstRho_p;


% Calculating Ixx of Lp
Ixx_Lp = (integral3(integral_func_Ixx_Lp,xminLp,xmaxLp,yminLp,ymaxLp,zminLp,zmaxLp));


% Calculating Iyy of Lp
Iyy_Lp = (integral3(integral_func_Iyy_Lp,xminLp,xmaxLp,yminLp,ymaxLp,zminLp,zmaxLp));


% Calculating Izz of Lp
Izz_Lp = (integral3(integral_func_Izz_Lp,xminLp,xmaxLp,yminLp,ymaxLp,zminLp,zmaxLp));


% Calculating Ixy of Lp
Ixy_Lp = (integral3(integral_func_Ixy_Lp,xminLp,xmaxLp,yminLp,ymaxLp,zminLp,zmaxLp));


% Calculating Ixz of Lp
Ixz_Lp = (integral3(integral_func_Ixz_Lp,xminLp,xmaxLp,yminLp,ymaxLp,zminLp,zmaxLp));


% Calculating Ixz of Lp
Iyz_Lp = (integral3(integral_func_Iyz_Lp,xminLp,xmaxLp,yminLp,ymaxLp,zminLp,zmaxLp));


% Inertia tensor for pen link, with density function specific to this link
Inertia_tensors_conststant_rho_pen = [ Ixx_Lp, Ixy_Lp, Ixz_Lp;
                                       Ixy_Lp, Iyy_Lp, Iyz_Lp;
                                       Ixz_Lp, Iyz_Lp, Izz_Lp];


% Removing all factors less then the tolerance
Inertia_tensors_conststant_rho_pen(Inertia_tensors_conststant_rho_pen < 0 & Inertia_tensors_conststant_rho_pen > -tol) = 0;
Inertia_tensors_conststant_rho_pen(Inertia_tensors_conststant_rho_pen > 0 & Inertia_tensors_conststant_rho_pen < tol) = 0


fprintf('Starting calculations of inertia matrix %s\n', datestr(now,'HH:MM:SS.FFF'))


% Defining matrix for inertia forces
D = zeros(n,n);


% Summing up the elements of the D matrix,
for i = 1:n


    D = D + (Link_masses(i)*Jvi{i}.'*Jvi{i} + Jwi{i}.'*Rotation_matrices{i}*Inertia_tensors_density_func{i}*Rotation_matrices{i}.'*Jwi{i});
    fprintf('Finished iteration number %d at %s\n', i, datestr(now,'HH:MM:SS.FFF'))


end


fprintf('Finished calculating inertia matrix at %s, started simplifying and substituting. This usuallually takes just over 1min\n', datestr(now,'HH:MM:SS.FFF'))


D = simplify(subs(D))


fprintf('Finished simplifying inertia matrix %s\n', datestr(now,'HH:MM:SS.FFF'))


% Writing inertia matrix to file
% fprintf('Started writing inertia matrix to file %s\n', datestr(now,'HH:MM:SS.FFF'))
% matlabFunction(D,'File','inertia_forces_numeric.m')
% fprintf('Finished writing inertia matrix to file %s\n', datestr(now,'HH:MM:SS.FFF'))


% Kinetic energy
Kinetic_energy = (1/2)*Joint_velocities.'*D*Joint_velocities;


% Lagrangian
L = Kinetic_energy - potential_energy;


% ----------------------------------------------------------------------%
%              Dynamics - Coreolis and Centrifugal Matrix               %
% ----------------------------------------------------------------------%


% Defining matrix for Coreolis (q_dot(j)*q_dot(k)) and Centrifugal (q_dot(j)^2) forces
C = sym(zeros(n,n));


fprintf('Starting calculations of C matrix %s\n', datestr(now,'HH:MM:SS.FFF'))


% Summing up the elements of the C matrix, using the christoffels symbols
    for j = 1:n
        for i = 1:n
            for k = 1:n


                C(i,j) = C(i,j) + (1/2)*( diff(D(i,j),Joint_variables(k)) + diff(D(i,k),Joint_variables(j)) - diff(D(j,k),Joint_variables(i)) )*Joint_velocities(k);


            end
        end
    end


fprintf('Finiched calculating C matrix at %s, started simplifying. This usuallually takes just over 1min\n', datestr(now,'HH:MM:SS.FFF'))


C = simplify(C)


fprintf('Finiched simplifying C matrix at %s\n', datestr(now,'HH:MM:SS.FFF'))


% Writing Coreolis and Centrifugal forces matrix to file
% fprintf('Started writing Coreolis and Centrifugal forces to file %s\n', datestr(now,'HH:MM:SS.FFF'))
% matlabFunction(C,'File','coreolis_and_centrifugal_forces_numeric.m')
% fprintf('Finished writing Coreolis and Centrifugal forces to file at %s\n', datestr(now,'HH:MM:SS.FFF'))


% ----------------------------------------------------------------------%
%                                 Notes                                 %
% ----------------------------------------------------------------------%


% https://www.mathworks.com/videos/generating-c-code-from-matlab-code-68964.html


end
