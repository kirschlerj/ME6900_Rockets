# ME6900_Rockets
Repo for ME6900 class; Team: Jack Kirschler &amp; Tony Tonkovich (Area = 0.5 m^2)

HW #1 - Completed Individually

HW #2 - Completed Individually

HW #3 - Completed as Team using separate MATLAB scripts

Project 1 - 
- [x] Part 1. Develop a rocket design using OpenRocket or similar to meet requirements and document results
- [x] Part 2. Develop Simulink dynamics model of a rocket meeting requirements
    - [x] 1. Use the frontal area from the last assignment.
    - [x] 2. Model motor as square wave output (based on standard size).
    - [x] 3. Import drag coefficient data from RockSim/OpenRocket drag coefficient.
    - [x] 4. Combine drag force and motor force and feed into 3 DoF equations of motion block.
       - [x] 4a. The use of your atmosphere model is required here
    - [x] 5. Specify mass and gravity force into 3DoF block. Optional to lose mass during flight.
    - [x] 6. Feedback the body velocity to be used for the aerodynamic calculations.
    - [x] 7. Define a stop condition at apogee (maximum height reached).
    - [x] 8. Add scopes to all major areas: Total drag force, motor force, combined forces, body velocity, dynamic pressure, altitude and position (Z & X), body accelerations, and any other significate data that shows details about flight or the model.
    - [x] 9. Simulate and tweak motor parameters to meet requirements.
    - [x] 10. Plot and report data using professional graphs/figures (export to matlab workspace).
- [x] Part 3. Presentation: 5 slides max detailing your model, how it works, and results

Project 2 - 
- [x] Use the previous assignment’s Simulink model and drag coefficient table data. 
- [x] Drag coefficient must vary by Mach 
- [x] Include the effects of altitude change (air density, speed of sound, gravity). Clearly define where the optimal point of turning for acceleration into orbit was chosen 
- [x] Utilize your existing atmospheric model to find density and speed of sound 
- [ ] Recommended: Fix at minimum CG to 1/3 back, and CP 1/2 of your total length back from nose. 
- [x] Specify mass as a function of time and variable gravity force into 3DoF block 
- [x] Have the initial body attitude in the 3DoF initial conditions as -90 deg (rocket pointing up to sky) 
- [ ] X body axis takes motor forces and drag 
- [x] Develop a stop condition for final altitude
- [ ] Provide data for the following areas in the report versus time: Total drag force, motor force, combined forces, body velocity, dynamic pressure, altitude/position (Z & X), angle, angular velocity, angular acceleration, body accelerations, and any other significant data that shows details about flight or the model – prove that your rocket achieved the altitude and orientation requirements 
- [ ] Report detailing how you built the model and all aspects showing all inputs and assumptions. Graph motor force, acceleration, velocity, position, and angular position, and velocity versus time (see next page for full list, 2 pages of text MAX with graphs, data, tables, and model pictures in appendix) 
- [ ] Presentation: 5 slides max detailing your model, how it works, and results 
- [ ] Bonus: After proving that your simulation performs the necessary tasks, generate a visualization output movie. One example is using Flightgear connected to Simulink. 
