function eta_c = F0007_compressorEfficiency(W_c, p_us, p_ds, par)

% parameters
eta_c_max = par.eta_c_max;
PiC_max   = par.PiC_max;
mco_max   = par.mco_max;
Q11       = par.Q11;
Q12       = par.Q12;
Q22       = par.Q22;

% pressure ratio
PiC = p_ds./p_us;

% Model 8.5, Compressor Efficiency
% Equation (8.41-42)
eta_c = ...
eta_c_max - ...
    ( (PiC - 1).^(1/2) - (PiC_max - 1).^(1/2)) .* ...
    ( Q12.*W_c - Q12.*mco_max + (Q22.*abs(PiC - 1))./(PiC - 1).^(1/2) - (Q22.*abs(PiC_max - 1))./(PiC_max - 1).^(1/2)) - ...
    (W_c - mco_max) .* ...
    (Q11.*(W_c - mco_max) + Q12.*(conj((PiC - 1).^(1/2)) - ...
    conj((PiC_max - 1).^(1/2))));

end

