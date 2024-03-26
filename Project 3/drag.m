function fd = drag(rho,v,Cd,A)

    if v < 0
        fd = (1/2)*rho*v^2*Cd*A;
    else
        fd = (-1/2)*rho*v^2*Cd*A;
    end
end 