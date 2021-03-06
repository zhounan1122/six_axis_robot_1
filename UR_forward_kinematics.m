function [ output_args ] = UR_forward_kinematics( input_args )
%UR_FORWARD_KINEMATICS 
%exp:[ output_args ] = UR_forward_kinematics( input_args )
%input_args:joint space;dimension:1*6
%output_args:operation space;dimension:4*4

%DH-table
%--------------------------------
a0 = 0;
alpha0 = 0;
d1 = 94.5;
theta1 = input_args(1);
%-------------------------------
a1 = 0;
alpha1 = -pi/2;
d2 = 130.5;
theta2 = input_args(2);
%-------------------------------
a2 = 425;
alpha2 = 0;
d3 = 120;
theta3 = input_args(3);
%------------------------------
a3 = 392.5;
alpha3 = -pi/2;
d4 = 93;
theta4 = input_args(4);
%------------------------------
a4 = 0;
alpha4 = -pi/2;
d5 = 93;
theta5 = input_args(5);
%-------------------------------
a5 = 0;
alpha5 = 0;
d6 = 0;
theta6 = input_args(6);
%------------------------------------

T_0_1 = [cos(theta1),-sin(theta1),0,0;
    sin(theta1),cos(theta1),0,0;
    0,0,1,d1;
    0,0,0,1];
T_1_2 = [cos(theta2),-sin(theta2),0,0;
    0,0,1,d2;
    -sin(theta2),-cos(theta2),0,0;
    0,0,0,1];
T_2_3 = [cos(theta3),-sin(theta3),0,a2;
    sin(theta3),cos(theta3),0,0;
    0,0,1,d3;
    0,0,0,1];
T_3_4 = [cos(theta4),-sin(theta4),0,a3;
    sin(theta4),cos(theta4),0,0;
    0,0,1,d4;
    0,0,0,1];
T_4_5 = [cos(theta5),-sin(theta5),0,0;
    0,0,1,d5;
    -sin(theta5),-cos(theta5),0,0;
    0,0,0,1];
T_5_6 = [cos(theta6),-sin(theta6),0,0;
    0,0,1,0;
    -sin(theta6),-cos(theta6),0,0;
    0,0,0,1];

output_args = T_0_1*T_1_2*T_2_3*T_3_4*T_4_5*T_5_6;
end

