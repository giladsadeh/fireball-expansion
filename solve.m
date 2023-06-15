
c = 29979245800;
Estart = 10^52;
ni = 10^(-2); %change!
mp = 1.67262192*10^(-24);
T3 = 17*Estart/(8*pi*ni*mp*c^2);
Gamma0 = 10^6;
Gammaf = 20;


t0 = nthroot(T3/(c^3*Gamma0^2), 3);
tf = nthroot(T3/(c^3*Gammaf^2), 3);
r0 = t0*c;
tspan = [t0 tf];

[t, R] = ode45(@odefun, tspan, r0);
[t2, R2] = ode78(@odefun, tspan, r0);
[t3, R3] = ode89(@odefun, tspan, r0);


loglog(t, R, "diamond--", "LineWidth", 2.5, "Color", "#A2142F", "MarkerSize", 12)
hold on
loglog(t2, R2,  "o--", "LineWidth", 2.5, "Color", 	"#7E2F8E", "MarkerSize", 10)
loglog(t3, R3,  "s--", "LineWidth", 2.5, "Color",	"#0072BD", "MarkerSize", 7)


ylabel("$R$ [cm]", "Interpreter","latex", "FontSize", 16)
xlabel("$t$ [sec]", "Interpreter", "latex", "FontSize", 16)
legend("ode45", "ode78", "ode89", 'Location','southwest', "FontSize", 14)
set(gca, 'XScale', 'log', 'YScale', 'log');

hold off

function dRdt = odefun(t,R)
c = 300000;
Estart = 10^52*10^(-7);
ni = 10^(-2); %change!
mp = 1.67262192*10^(-24);
T3 = 17*Estart/(8*pi*ni*mp*c^2);
dRdt = sqrt((T3-R^3)*c^2/T3);
end