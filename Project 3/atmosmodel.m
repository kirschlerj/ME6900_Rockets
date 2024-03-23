function [density, c] = atmosmodel(alt)
 
    c_data = load('Atmosphere_Model/c.mat').alt;
    rho_data = load('Atmosphere_Model/rho.mat').alt;
    alt_data = load('Atmosphere_Model/altitude.mat').alt;
    density = interp1(alt_data, rho_data, alt, 'linear');
    c = interp1(alt_data, c_data, alt, 'linear');
 
    density(alt < min(alt_data)) = rho_data(1);
    density(alt > max(alt_data)) = rho_data(end);
    c(alt < min(alt_data)) = c_data(1);
    c(alt > max(alt_data)) = c_data(end);
      
    
end

