function u = F0005_energy(T,rho)
%INTERNALENERGY
%    U = INTERNALENERGY(T,RHO)

%    This function was generated by the Symbolic Math Toolbox version 8.7.
%    04-Nov-2021 19:06:03

t2 = rho.^2;
t3 = rho.^3;
t4 = 1.0./T;
t5 = rho./1.5508e+4;
t6 = -t5;
t8 = t4.*3.3145e+1;
t9 = t5-3.9e+1./2.5e+2;
t10 = t5-6.7e+1./1.0e+2;
t11 = t5-2.17e+2./1.25e+2;
t12 = t5-7.53e+2./5.0e+2;
t13 = t5-8.31e+2./5.0e+2;
t49 = t4.*6.858999999999336e+3;
t50 = t4.*5.309999999993605e+2;
t51 = t4.*1.98899999999884e+3;
t53 = t4.*2.484000000001446e+3;
t54 = t4.*7.51000000000887e+2;
t7 = exp(t6);
t14 = t9.^2;
t15 = t10.^2;
t16 = t11.^2;
t17 = t12.^2;
t18 = t13.^2;
t19 = t8-7.164e-1;
t20 = t8-7.204e-1;
t21 = t8-1.5445;
t22 = t8-1.3444;
t23 = t8-1.4517;
t52 = -t49;
t55 = -t50;
t56 = -t51;
t57 = -t53;
t58 = -t54;
t24 = t19.^2;
t25 = t20.^2;
t26 = t21.^2;
t27 = t22.^2;
t28 = t23.^2;
t29 = t14.*(4.89e+2./1.0e+3);
t30 = t16.*(1.03e+2./1.0e+3);
t32 = t17.*(3.37e+2./2.0e+2);
t33 = t15.*2.506;
t37 = t18.*1.607;
t59 = exp(t52);
t60 = exp(t55);
t61 = exp(t56);
t62 = exp(t57);
t63 = exp(t58);
t31 = -t29;
t34 = -t30;
t35 = -t32;
t36 = -t33;
t38 = -t37;
t39 = t24.*(1.71e+2./1.0e+3);
t40 = t27.*2.245e-1;
t42 = t25.*2.785e-1;
t45 = t26.*3.967e-1;
t46 = t28.*1.304e-1;
t41 = -t39;
t43 = -t40;
t44 = -t42;
t47 = -t45;
t48 = -t46;
t64 = t31+t43;
t65 = t35+t41;
t67 = t36+t44;
t69 = t34+t48;
t72 = t38+t47;
t66 = exp(t64);
t68 = exp(t65);
t70 = exp(t67);
t71 = exp(t69);
t73 = exp(t72);
et1 = T.*1.2471708e+1-(t59.*6.940424851620928e+4)./(t59-1.0);
et2 = (t60.*(-7.134615165303407e+3))./(t60-1.0)+(t61.*1.309768796792836e+4)./(t61-1.0);
et3 = (t62.*(-1.565508652359312e+4))./(t62-1.0)+(t63.*2.570724159925436e+3)./(t63-1.0);
et4 = rho.*1.0./t8.^(1.1e+1./1.0e+3).*3.708482510740261e-2+rho.*1.0./t8.^(5.11e+2./1.0e+3).*3.928265974354533e-2;
et5 = rho.*1.0./t8.^3.156e-1.*(-8.436123227090361e-2)+t2.*1.0./t8.^(1.97e+2./1.0e+3).*6.740657048206955e-7;
et6 = t3.*t8.^(4.09e+2./1.0e+3).*1.363696980861286e-11-t2.*t8.^1.444e-1.*1.758338147046353e-6;
et7 = t2.^2.*4.764633820313524e-17-rho.*t7.*t8.^(3.77e+2./5.0e+2).*2.42314192885329e-2;
et8 = rho.*t8.^(9.93e+2./5.0e+2).*t73.*2.957410415947438e-3+rho.*t8.^4.646.*t66.*2.270624724947404e-3;
et9 = rho.*t8.^6.249.*t70.*(-2.985372284682706e-3)+t3.*1.0./t8.^(2.09e+2./1.0e+3).*t71.*1.881231772261721e-12;
et10 = t3.*t7.*t8.^(3.11e+2./1.0e+3).*3.409271428093691e-11;
et11 = t2.*t8.^3.187.*t68.*(-1.015775549591232e-7);
et12 = rho.*t8.^5.646.*t66.*(t4.*1.4882105e+1-6.036356e-1).*(-4.021652010179603e-4);
et13 = rho.*t8.^7.249.*t70.*(t4.*1.8461765e+1-4.012628e-1).*4.118322919965107e-4;
et14 = t2.*t8.^4.187.*t68.*(t4.*1.133559e+1-2.450088e-1).*2.426022330048322e-8;
et15 = t3.*t8.^(7.91e+2./1.0e+3).*t71.*(t4.*8.644216-3.7860336e-1).*(-2.378295540153882e-12);
et16 = rho.*t8.^2.986.*t73.*(t4.*2.6297243e+1-1.2254063).*(-9.90425457450582e-4)+5.203221931700199e+2;
u = et1+et2+et3+et4+et5+et6+et7+et8+et9+et10+et11+et12+et13+et14+et15+et16;
