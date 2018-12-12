function pressure = getPressure(speedU, speedV)

rho = 1000;
g = 9.81;
c = 0;

absoluteSpeed = speedU.^2 + speedV.^2;

pressure = rho*g*(c-(absoluteSpeed/(2*g)));

end
