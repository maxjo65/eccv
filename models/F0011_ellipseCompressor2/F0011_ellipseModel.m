function W_corr = F0011_ellipseModel(Pi_c, Pi_ch, PI_ZSL, CUR, W_ZSL, W_ch, par)
% inputs
u1 = min(Pi_c, PI_ZSL);
u2 = Pi_ch;
u3 = PI_ZSL;
u4 = CUR;
u5 = W_ZSL;
u6 = W_ch;

% corrected flow
W = u5 + ...
        (u6-u5) .* ( ...
                        (1 - ( (u1-u2)./(u3-u2) ).^u4).^(1./u4) ...
                    );
                
% surge flow
W_corr_surge = F0011_linearSurgeFlow(W_ZSL, PI_ZSL, Pi_c, par);

% temp flow
W_c = W;

% surge switch
idx       = Pi_c <  PI_ZSL;
W_c(idx)  = W(idx);
W_c(~idx) = W_corr_surge(~idx);

% choke switch
idx       = min(Pi_c,PI_ZSL) <= Pi_ch;
W(idx)    = W_ch(idx);
W(~idx)   = W(~idx);

% output
W_corr = W;
end