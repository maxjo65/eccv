function T_m = F0012_membraneTemp(T_an, T_ca, Q_gen, par)
% parameters
R4 = par.R4;
R5 = par.R5;

% output
T_m = R5/(R4 + R5) * T_an + R4/(R4 + R5) * T_ca + R4*R5/(R4 + R5) * Q_gen;
end