function Q_cl = F0012_coolingPower(T_cp, T_in, W, par)
% parameters
hA = par.hA;
cp = par.cp;

% output
Q_cl = 2*hA*W*cp/(hA + 2*W*cp) * (T_cp - T_in);
end