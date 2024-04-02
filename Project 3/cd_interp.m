function [cdcurrent] = cd_interp(v,c)

    % Sim Data
    mach = load('Sim_Data\mach2.mat').mach;
    cd = load('Sim_Data\cd2.mat').cd;
    
    machcurrent = v/c;
    cdcurrent = interp1(mach, cd, machcurrent, 'nearest','extrap');
        

end

