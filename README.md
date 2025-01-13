# Control-of-A-Quadrotor-For-Medical-Service
Nonlinear Computed Torque Control of A Quadcopter.
## Computed Tourque Control
A well-known robotic controller based on the nonlinear control technique feedback linearization. In a simple manner, it "theoretically" eliminates the system non-linearities represented in the M, C, and G matrices in the robotic equation of motion:
![CTC](https://github.com/engmohamed374/RRR_Computed_Torque_Control-CTC-/blob/76a955858110b5bec76685bf6cc9cd914230ece6/CTC.png)
As shown in the figure below, it is easy to understand that the control cosists of two loops, the inner loop which is responsible for eliminating the systemm nonlinearities, and the outer loop which is responsible for the motion control. The inner loop is the application of the feedback linearization technique while the outer loop is just a linear control technique known as PID control.

## Publication
You can find a detailed mathematical modeling for the quadcopter, control, and CFD analysis [here](https://digitalcommons.aaru.edu.jo/erjeng/vol8/iss5/3 "here").
