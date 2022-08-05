function Nu = F0017_Nusselt(Re, Pr, par)

% parameters
d = par.d;
L = par.L;

% Nusselt number relation, J.P Holman eq. 6-9:
Nu = 3.66 + ...
    (0.0668.*(d./L) .* Re .* Pr) ./ ...
    (1 + 0.04 .*( max( (d./L) .* Re .* Pr , 1e-10) ).^(2/3) );

