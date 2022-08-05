function T = F0017_enthalpyToTemperature(H, par)
    % parameters
    T0 = par.T0_clt;
    H0 = par.H0_clt;
    cp = par.cp_clt;
    
    % temperature
    T = T0 + 1./cp .* (H - H0);

end