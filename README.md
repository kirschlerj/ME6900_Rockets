# ME6900_Rockets
Repo for ME6900 class; Team: Jack Kirschler &amp; Tony Tonkovich

HW #1 - Completed Individually

HW #2 - Completed Individually

HW #3 - Completed as Team using separate MATLAB scripts

Project 1 - 
    Develop a rocket design using OpenRocket or similar to meet requirements and document results
    Develop Simulink dynamics model of a rocket meeting requirements
        Use the frontal area from the last assignment.
        Model motor as square wave output (based on standard size).
        Import drag coefficient data from RockSim/OpenRocket drag coefficient.
        Combine drag force and motor force and feed into 3 DoF equations of motion block.
            The use of your atmosphere model is required here
        Specify mass and gravity force into 3DoF block. Optional to lose mass during flight.
        Feedback the body velocity to be used for the aerodynamic calculations.
        Define a stop condition at apogee (maximum height reached).
        Add scopes to all major areas: Total drag force, motor force, combined forces, body velocity, dynamic pressure, altitude and position (Z & X), body accelerations, and any other significate data that shows details about flight or the model.
        Simulate and tweak motor parameters to meet requirements.
        Plot and report data using professional graphs/figures (export to matlab workspace).
    Presentation: 5 slides max detailing your model, how it works, and results
