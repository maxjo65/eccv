function H = F0017_temperatureToEnthalpy(T, par)
    % parameters
    T0 = par.T0_clt;
    H0 = par.H0_clt;
    cp = par.cp_clt;
    
    % enthalpy
    H = H0 + cp.*(T - T0);

end