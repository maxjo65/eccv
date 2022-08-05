function T_out = F0012_outletTemperature(T_cp, T_in, W, par)
% parameters
hA = par.hA;
cp = par.cp;

% output
T_out = 2*hA/(hA + 2*W*cp) * T_cp + (2*W*cp - hA)/(hA + 2*W*cp) * T_in;
end


