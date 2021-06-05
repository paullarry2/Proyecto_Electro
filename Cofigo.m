%% Proyecto Teoria Electromagnetica
% Diego Mazariegos
% Larry Paul 
% Luis Pedro
% 04/06/2021

%% Dipolos y Expansion multipolar

% Ejercicio 1
clc;
clear;
c = 10e-9; % la carga que suponemos es de 10 nC
d = 2; % distancia a la que estan 
% Espacio Vectorial Donde existe el dipolo
l1 = linspace(-2,2,15);
l2 = linspace(-pi/2,pi/2,15);
l3 = linspace(0,2*pi,15);
x0 = 0;
y0 = 2;
z0 = 2;
[rg,pg,tg] = meshgrid(l1,l3,l2); % Delimito el area donde existe mi dipolo 
[xg,yg,zg] = sph2cart(pg,tg,rg); % Espacio vectorial a cartesianas

r = sqrt(xg.^2+(yg).^2+(zg).^2); % Componente en r
theta = atan(sqrt(xg.^2+(yg).^2)./(zg)); % Componente theta (0,pi)
phi = atan(xg./(yg));

% Potenciales 
eo = 8.84*10^-12;
k = (4*pi*eo);
p = 2*10^-9;

% v = (p.*cos(theta))./(k.*r.^2);
% [U,V] = gradient(-v);

% Er = 2.*sin(theta).*sin(phi);
% Eth = - cos(theta).*sin(phi);
% Eph = -cos(phi);
Er = (2.*cos(theta))./(r.^3);
Eth = (sin(theta))./(r.^3);
Eph = 0;
E = sqrt(Eth.^2+Eph.^2 + Er.^2);


figure(1)
h=quiver3(xg,yg,zg,Eph./E,Eth./E,Er./E);


%% Polarización 
 %Todos las graficas para polarización se encuentran aqui
%% Mapa de colores
% Densidad Superficial
r=1*ones(15,1);
phi=linspace(0,2*pi,15);
[r,phi]=meshgrid(r,phi);
x=r.*cos(phi);
y=r.*sin(phi);
k = 0.3;
ao = 0.5;
g = -r.^2/ao;
c = -k.*exp(g);
z=repmat(linspace(0,2,15),15,1);
figure(2);
surf(x,y,z,c);


%% Densidad Volumetrica

[T,R] = meshgrid(linspace(0,2*pi,64),linspace(1,2,16)); %
X = R.*cos(T);
Y = R.*sin(T);
Zpb = k.*exp(-R.^2./ao).*((2.*R)./(ao)-(1)./(R));
figure(3);
surf(X,Y,Zpb);

% Campo Electrico
theta = linspace(0,2*pi,64);
s = linspace(1,2,16);
z = linspace(0,15,64);
[theta,s,z] = meshgrid(theta,s,z);
[x,y,z] = cart2pol(theta, s,z);
u_x = x.*cos(theta) - y.*sin(theta);
u_y = x.*sin(theta) + y.*cos(theta);

E = -k.*exp(-s.^2./ao)./eo;

quiver(x,y,E,z,'autoscalefactor',0.6);


