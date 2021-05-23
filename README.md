# <div align="center"> Group 7 - RW-V0 </div>
<div align="center">Spring 2021 MECA482-01 Reaction Wheel Project. </div>

___________________________________________________________________________________________________________________________________________________________________________________

    Project Members:

#### <div align="center"><br>Bailey Burja</br><br>Phinease Francis</br><br>Kevin Seaman</br><br>Cher Thor</br></div>
 <div style="page-break-after: always;"></div>  


# <b>Introduction:</b>
   <br>The Presentation Video of the project is located [here.](https://www.youtube.com/watch?v=R6euByfGaN4)</br>

Elderly individuals often use a cane to help maintain balance when walking; however, when they do not need the cane at a given moment, it will frequently fall onto the ground unless leaned on another object. The goal is to create a device that maintains a stable vertical orientation by using a dual axis reaction wheel set up. The system will be able to counteract an external force that would cause the system to fall over. 
For simplicity, the system will use a single Inertial Wheel Pendulum to investigate and model the given scenario.
 
 
 A capabilites database, functional viewpoint, and proposed machine design were created. This step is critical in the Control System Design process where the intial steps to all projects is to establish goals, potential variables, and specifications of the system. The following pictures will reflect the Capabilies Database, functional viewpoint, and proposed machine design repectively. 
<p align="center"><br><img src=https://github.com/bmburja/RW-V0/blob/fa0d6d871337030d437b4f272b933bfcbbb3a5e2/images/capabilites%20database.png></br>

<p align="center"><br><img src=https://github.com/bmburja/RW-V0/blob/25d6ed7213d246b611cf08faee7377e1f79d8742/images/functional%20viewpoint.png></br>


<p align="center"><br><img src=https://github.com/bmburja/RW-V0/blob/25d6ed7213d246b611cf08faee7377e1f79d8742/images/Machine%20Diagram.png></br>

# <b>Modeling:</b>
A visual representation of our model can be seen in the figure below.
<p align="center"><br>
<img src=https://github.com/bmburja/RW-V0/blob/2428cbee41945481eb1b34a0fc19ec783a876252/images/FBD%20IWP.png>
</br></p>
<p align="center"><br>Free Body Diagram of Inverted Wheel Pendulum.</br>


<p align="center"><br>Nomenclature</br>
<p align="center"><br>x₀ = x-axis</br>
<p align="center"><br>xp = pendulum's position relative to the x-axis</br>
<p align="center"><br>y₀ =y-axis</br>
<p align="center"><br>yp = pendulum's position relative to the y-axis</br>
<p align="center"><br>Mp = mass of pendulum</br>
<p align="center"><br>lp= length of pendulum(cane)</br>



In order to determine the mathematical representation of an inverted pendulum that is controlled by a reaction wheel, it is simplest to start by using the 2 euler-lagrangian equations shown in equation 1 and 2.

<p align="center"><br><img src=https://github.com/bmburja/RW-V0/blob/5b186209effb578b7aac4ecb571f1dca85dbd544/images/eq1.png></br>

The lagrangian for these equations is given by equation 3 and shows that it is equal to the sum of the kinetic energies of the arm and wheel and the potential energies of both as well.

<p align="center"><br><img src=https://github.com/bmburja/RW-V0/blob/5b186209effb578b7aac4ecb571f1dca85dbd544/images/eq2.png></br>

The kinetic energy of the armKais given as the sum of the kinetic energy of a rod rotating about its center and the kinetic energy of a mass at a given distance from the end of the arm that is moving along the circumference of a circle of radius lc. The kinetic energy of the wheel Kwis the same as the kinetic energy of the arm but the energy of the wheel must take into account that it is also rotating in addition to the arm rotating.

<p align="center"><br><img src=https://github.com/bmburja/RW-V0/blob/5b186209effb578b7aac4ecb571f1dca85dbd544/images/eq3.png></br>

The potential energy of each part needs to be based on the fact that the potential of the system will be 0 if the arm is ever pointed vertically down. This is accomplished using equations 6 and 7 for the arm and wheel respectively.

<p align="center"><br><img src=https://github.com/bmburja/RW-V0/blob/5b186209effb578b7aac4ecb571f1dca85dbd544/images/eq4.png></br>


Taking equations 4, 5, 6, and 7 and putting them into equation 3 gives the entire lagrangian that can be used in equations 1 and 2. 

<p align="center"><br><img src=https://github.com/bmburja/RW-V0/blob/5b186209effb578b7aac4ecb571f1dca85dbd544/images/eq5.png></br>

The result from the euler-lagrange equations can be converted into a matrix equation shown in equation 9. This equation is the mathematical model that represents the pendulum at any given position and time. For this system, there is some inherit stabilizing factors in the motor itself that would assist in stabilizing the pendulum when it is inverted, but it has been elected to be ignored since it introduces another variable that must be accounted for and the change makes the system more consistent for a wider range of motors allowing for more flexibility in the design without needing to redesign the system.

<p align="center"><br><img src=https://github.com/bmburja/RW-V0/blob/5b186209effb578b7aac4ecb571f1dca85dbd544/images/eq6.png></br>

A few simplifications can be made here shown below.

<p align="center"><br><img src=https://github.com/bmburja/RW-V0/blob/93bfd54e9b109359664d23005afcd0e9fd07f829/images/eq7.png></br>

Equation 9 can be rearranged into equation 10

<p align="center"><br><img src=https://github.com/bmburja/RW-V0/blob/93bfd54e9b109359664d23005afcd0e9fd07f829/images/eq8.png></br>

From here, equation 10 can be converted into a state space equation. To start the state vector can be defined as:

<p align="center"><br><img src=https://github.com/bmburja/RW-V0/blob/93bfd54e9b109359664d23005afcd0e9fd07f829/images/eq9.png></br>

and the inverse of D as:

<p align="center"><br><img src=https://github.com/bmburja/RW-V0/blob/93bfd54e9b109359664d23005afcd0e9fd07f829/images/eq10.png></br>

Taking these statements and using them with equation 10 gives equation 11.

<p align="center"><br><img src=https://github.com/bmburja/RW-V0/blob/93bfd54e9b109359664d23005afcd0e9fd07f829/images/eq11.png></br>

 Taking the partial derivative of equation 11 with respect to x gives our value for A in our standard state space equation and taking the partial derivative with respect to 𝜏 gives the value of B. Our final state space equations are shown in equation 12.
 
 <p align="center"><br><img src=https://github.com/bmburja/RW-V0/blob/93bfd54e9b109359664d23005afcd0e9fd07f829/images/eq12.png></br>

# <b>Controller Design and Simulations:</b>
The simulation was done in Coppelia. The basic system can be seen below, where two joints are implemendted. The joints are used to control the position of the pendulum arm and the angular velocity of the attached reaction wheel.

<p align="center"><br><img src=https://github.com/bmburja/RW-V0/blob/3cea1949681bbf2a3f6dd9b79ae28f654c8f90f7/images/Coppeliasim%20Model.png></br>


A couple challenges experienced throughout the design project was mainly implementing the MATLAB codes into simulation of CoppeliaSim. Being first exposed to CoppeliaSim tested the team’s effort in troubleshooting the integration of the files. Backtrack of instructions provided by the instructor was taken and followed as perceived. From there, the team was back on track in importing the MATLAB files into Coppelia and performing the pendulum simulation pertaining to the cane design. One minor challenge from the beginning use of Coppelia is the axis of modeling compared to SOLIDWORKS are different, to which only took a small amount of time to familiarize the defaulted projection of axis.

# <b>Appendix A - MATLab Code</b>
<br>Closed Loop Model:</br>
<br>clc; clear; close all;</br>

<br>% Motor parameters (from vendor or references)</br>
<br>R=4.172;</br>
<br>km = 0.00775;</br>
<br>Umax = 13;</br>

<br>% Inertial wheel model</br>
<br>g = 9.81;                           % Gravitational acceleration</br>
<br>mgl = 0.12597;</br>
<br>mbg = mgl;</br>
<br>d11 = 0.0014636;</br>
<br>d12 = 0.0000076;</br>
<br>d21 = d12;</br>
<br>d22 = d21;</br>

<br>J = (d11*d22-d12*d21)/d12;</br>
<br>D = [d11 d12; d21 d22];</br>
<br>Di = inv(D);</br>
<br>di11 = Di(1,1);</br>
<br>di12 = Di(1,2);</br>
<br>di21 = Di(2,1);</br>
<br>di22 = Di(2,2);</br>

<br>% Linear approximate model of IWP</br>
<br>A = [ 0 1 0; di11*mbg 0 0; di21*mbg 0 0];</br>
<br>B = [0; di12*km/R; di22*km/R];</br>

<br>%System parameters </br>
<br>C = eye(size(A));</br>

<br>%No need to define D</br>
<br>D = (0);</br>


<br>% Controllability for making sure of the application of</br> 
<br>% full-state feedback</br>
<br>disp('Is the system controllable?');</br>
<br>Pc = ctrb(A,B);</br>
<br>if rank(Pc) == size(Pc)</br>
<br>    disp('Yes.');</br>
<br>else</br>
<br>    disp('No.');</br>
<br>end</br>

<br>% Desired closed-loop eigenvalues (from requirements)</br>
<br>s1 = -9.27 + 20.6i;</br>
<br>s2 = -9.27 - 20.6i;</br>
<br>s3 = -0.719;</br>
<br>Vp = [ s1, s2, s3];</br>
<br>K = place(A, B, Vp);</br>

<br>% Verify closed-loop eigenvalues of A_new or A_cl</br>
<br>Vp_ = eig(A-B*K);</br>



# <b>References</b>
<br>[1] [V. M. Hernandez-Guzman and R. Silva-Ortigoza, Automatic Control with Experiments, Springer, 2019](https://github.com/bmburja/RW-V0/blob/4c3ac820bf4576e9591de4e1ac676b372beb2c9b/Refernces/automatic%20control%20with%20experiments.pdf)</br>
<br>[2] [Control Tutorials for MATLAB and SIMULINK - Inverted Pendulum](https://ctms.engin.umich.edu/CTMS/index.php?example=InvertedPendulum&section=SystemModeling)
</br>
<br>[3] [M. W. Spong, P. Corke, and R. Lozano, Nonlinear control of the reaction wheel pendulum,Automatica, vol. 37, no. 11, pp. 1845–1851, 2001](https://github.com/bmburja/RW-V0/blob/a968ad0e825794ac178022c1206daffe6f3a64e6/Refernces/Nonlinear%20control%20of%20the%20Reaction%20Wheel%20Pendulum.pdf)</br>
