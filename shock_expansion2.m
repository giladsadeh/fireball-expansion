
c = 29979245800;
Estart = 10^52;
ni = 10^(-2); %change!
mp = 1.67262192*10^(-24);
T3 = 17*Estart/(8*pi*ni*mp*c^2);
Gamma0 = 10^6;
Gammaf = 20;
interval = 10^7;


t0 = nthroot(T3/(c^3*Gamma0^2), 3);
r0 = t0*c;
tspan = [t0 t0+interval];

exp = Gamma0;

while exp>20

[t, R] = ode78(@odefun, tspan, r0);
R_end = R(end)

exp = findGamma(R(end))
if exp>20
    tspan = [t0 t(end)+interval]
end


end

loglog(t, R, "diamond--", "LineWidth", 2.5, "Color", "#A2142F", "MarkerSize", 12)
hold on


ylabel("$R$ [cm]", "Interpreter","latex", "FontSize", 16)
xlabel("$t$ [sec]", "Interpreter", "latex", "FontSize", 16)
set(gca, 'XScale', 'log', 'YScale', 'log');

hold off

function dRdt = odefun(t,R)
c = 29979245800;
Estart = 10^52;
ni = 10^(-2);
mp = 1.67262192*10^(-24);
T3 = 17*Estart/(8*pi*ni*mp*c^2);
dRdt = sqrt((T3-R^3)*c^2/T3);
end

function Gma = findGamma(R)
c = 29979245800;
Estart = 10^52;
ni = 10^(-2);
mp = 1.67262192*10^(-24);
T3 = 17*Estart/(8*pi*ni*mp*c^2);
Gma = sqrt(T3/R^3);
end


