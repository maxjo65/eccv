function gear_req   = F0015_gearSelector(v, dV, gear)
%#codegen
% Transmission control unit
switch gear
    case 2 % We are in high gear
        if (v<35)&&(dV<0)
            % we have low speed and deceleration
            gear_req=1;
        else
            gear_req=2;
        end
    case 1 % We are in low gear
        if (v>40)
            gear_req=2;
        else
            gear_req=1;
        end
    otherwise
        disp('Should not be here');
        gear_req=2;
end
            
end