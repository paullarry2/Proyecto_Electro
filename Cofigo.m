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
N =20;
rho = linspace(0,2,N);
theta = linspace(-pi/2,pi/2,N);
phi = linspace(0,2*pi,N);
x0 = 0;
y0 = 2;
z0 = 2;
[rho,phi,theta] = meshgrid(rho,phi,theta); % Delimito el area donde existe mi dipolo 
[x,y,z] = sph2cart(phi,theta,rho); % Espacio vectorial a cartesianas

%theta de 0 a pi
%phi de 0 a 2pi

% Potenciales 
eo = 8.84*10^-12;
k = (4*pi*eo);
p = 2*10^-9;

% Er = 2.*sin(theta).*sin(phi);
% Eth = - cos(theta).*sin(phi);
% Eph = -cos(phi);

Er = (2.*sin(theta))./(rho.^3);
Eth = (cos(theta))./(rho.^3);
Eph = 0;%(sin(phi))./(rho.^3);%(-cos(phi))./(rho.^3);
rx = cos(theta).*cos(phi);
ry = cos(theta).*sin(phi);
rz = sin(theta);
thetax = sin(theta).*cos(phi);
thetay = sin(theta).*sin(phi);
thetaz = -cos(theta);
phix = -sin(phi);
phiy = cos(phi);

Ex = ((Er.*rx)+(Eth.*thetax)+(Eph.*phix));
Ey = ((Er.*ry)+(Eth.*thetay)+(Eph.*phiy));
Ez = ((Er.*rz)+(Eth.*thetaz));
E = sqrt(Ex.^2+Ey.^2 + Ez.^2);

figure(1)
h=quiver3(x,y,z,Ex./E,Ey./E,Ez./E, 'autoscalefactor',1);
xlabel('Eje x');
ylabel('Eje y');
zlabel('Eje z');
title('Dipolo Eje z')

%% Angulo aplpha
clc;
clear;
c = 10e-9; % la carga que suponemos es de 10 nC
d = 2; % distancia a la que estan 
% Espacio Vectorial Donde existe el dipolo
N =15;
rho = linspace(0,2,N);
theta = linspace(-pi/2,pi/2,N);
phi = linspace(0,2*pi,N);
x0 = 0;
y0 = 2;
z0 = 2;
[rho,phi,theta] = meshgrid(rho,phi,theta); % Delimito el area donde existe mi dipolo 
[x,y,z] = sph2cart(phi,theta,rho); % Espacio vectorial a cartesianas

% Potenciales 
eo = 8.84*10^-12;
k = (4*pi*eo);
p = 2*10^-9;
ao = pi./4;

Er = (2.*(cos(ao).*sin(theta)+sin(ao).*sin(theta).*cos(phi)))./(rho.^3);
Eth = (cos(ao).*cos(theta)-sin(ao).*sin(theta).*cos(phi))./(rho.^3);
Eph = (sin(ao).*sin(phi))./(rho.^3);
rx = cos(theta).*cos(phi);
ry = cos(theta).*sin(phi);
rz = sin(theta);
thetax = sin(theta).*cos(phi);
thetay = sin(theta).*sin(phi);
thetaz = -cos(theta);
phix = -sin(phi);
phiy = cos(phi);

Ex = ((Er.*rx)+(Eth.*thetax)+(Eph.*phix));
Ey = ((Er.*ry)+(Eth.*thetay)+(Eph.*phiy));
Ez = ((Er.*rz)+(Eth.*thetaz));
E = sqrt(Ex.^2+Ey.^2 + Ez.^2);

figure(7)
h=quiver3(x,y,z,Ex./E,Ey./E,Ez./E, 'autoscalefactor',1);
xlabel('Eje x');
ylabel('Eje y');
zlabel('Eje z');
title('Dipolo Eje z')


%% Dipolo distancia a
clc;
clear;
c = 10e-9; % la carga que suponemos es de 10 nC
d = 0.5; % distancia a la que estan
a = 2;
% Espacio Vectorial Donde existe el dipolo
N =15;
rho = linspace(0,2,N);
theta = linspace(-pi/2,pi/2,N);
phi = linspace(0,2*pi,N);
x0 = 0;
y0 = 2;
z0 = 2;
[rho,phi,theta] = meshgrid(rho,phi,theta); % Delimito el area donde existe mi dipolo 
[x,y,z] = sph2cart(phi,theta,rho); % Espacio vectorial a cartesianas

% Potenciales 
eo = 8.84*10^-12;
p = 2*10^-9;
k= p./(pi.*eo);

Er = k.*(sin(theta))./(rho.^3);
Eth = k.*(2./4).*(cos(theta))./(rho.^3);
Eph = 0;
rx = cos(theta).*cos(phi);
ry = cos(theta).*sin(phi);
rz = sin(theta);
thetax = sin(theta).*cos(phi);
thetay = sin(theta).*sin(phi);
thetaz = -cos(theta);
phix = -sin(phi);
phiy = cos(phi);

Ex = ((Er.*rx)+(Eth.*thetax)+(Eph.*phix));
Ey = ((Er.*ry)+(Eth.*thetay)+(Eph.*phiy));
Ez = ((Er.*rz)+(Eth.*thetaz));
E = sqrt(Ex.^2+Ey.^2 + Ez.^2);

figure(7)
h=quiver3(x,y,z,Ex./E,Ey./E,Ez./E, 'autoscalefactor',1);
xlabel('Eje x');
ylabel('Eje y');
zlabel('Eje z');
title('Dipolo Eje z (Dipolos distancia a)')



rho = 0.5;
% rho = linspace(0.5,3,100);
theta = linspace(-pi/2,pi/2,100);
% theta = pi./16;
phi = linspace(0,2.*pi,100);
[theta_p,phi_p,rho_p] = meshgrid(theta,phi,rho);
[x,y,z] = sph2cart(phi_p,theta_p,rho_p);
 v = k.*(2./4).*sin(theta)./(rho_p.^2);
figure(6)
%surf(x,y,z,v);
surf(x,y,sqrt(x.^2+y.^2),v);
colorbar;
xlabel('Eje x');
ylabel('Eje y');
zlabel('Eje z');
title('Dipolo Eje z (theta constante)')


%% Potencial 
eo = 8.84*10^-12;
k = (4*pi*eo);
p = 2*10^-9;
rho = 0.5;
% rho = linspace(0.5,3,100);
theta = linspace(-pi/2,pi/2,100);
% theta = pi./16;
phi = linspace(0,2.*pi,100);
[theta_p,phi_p,rho_p] = meshgrid(theta,phi,rho);
[x,y,z] = sph2cart(phi_p,theta_p,rho_p);
 v = (p.*cos(theta_p).*sin(phi_p))./(k.*rho_p.^2);
figure(6)
% surf(x,y,z,v);
surf(x,y,sqrt(x.^2+y.^2),v);
colorbar;
xlabel('Eje x');
ylabel('Eje y');
zlabel('Eje z');
title('Dipolo Eje y')

% %  [x,y,z] = pol2cat(theta_p,rho_p,v);
% % % [U,V] = gradient(-v);
% % figure(5);
% % surf(x,y,z);

%% Polarizaci?n 
 %Todos las graficas para polarizaci?n se encuentran aqui
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

%% Ejercicio 1
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
[x,y,z] = pol2cart(theta, s,z);
u_x = x.*cos(theta) - y.*sin(theta);
u_y = x.*sin(theta) + y.*cos(theta);

E = -k.*exp(-s.^2./ao)./eo;

[U,V,W] = pol2cart(theta,E,z);
figure(4);
quiver3(x,y,z,U,V,W,'autoscalefactor',0.6);

%% Ejercicio 2


%% Desplazamiento
rho = linspace(0,3,50);
theta = linspace(-pi/2,pi/2,50);
phi = linspace(0,2*pi,50);
Q = 10*10^-4;
a = 1;
y = zeros(50);
% D1 = (Q.*rho)./(4.*pi.*a.^3);
% D2 = (Q)./(4.*pi.*rho.^2);
% for i = length(rho)
%     if rho(i)< a
%         y(i) = (Q.*rho(i))./(4.*pi.*a.^3);
%     elseif (rho(i)>=a)
%         y(i) = (Q)./(4.*pi.*rho(i).^2);
%     end
% end

y1 = (Q.*rho)./(4.*pi.*a.^3).*(rho<1)+(Q)./(4.*pi.*rho.^2).*(rho>1);
y2 = (Q)./(4.*pi.*rho.^2);

figure(8);
plot(rho,y1);
xlabel('Radio');
ylabel('Desplazamiento');
title('Desplazamiento Electrico vs Distancia')

%% Campo electrico
clc;
clear;
eo = 8.84*10^-12;
rho = linspace(0,5,50);
theta = linspace(-pi/2,pi/2,50);
phi = linspace(0,2*pi,50);
Q = 10*10^-4;
a = 1;
er = 5; % Constante dielectrica del vidrio
k = 0.3;
D1 = (Q.*rho)./(4.*pi.*a.^3);
D2 = (Q)./(4.*pi.*rho.^2);

E1 = D1./(eo);
E2 = D2./(eo.*er);
E3 = (D2 + k.*rho)./(eo);
E4 = D2./eo;
y2 = E1.*(rho<1)+ E2.*((rho>1).*(rho<2)) + E3.*(rho>2).*(rho<4) + E4.*(rho>4);
figure(9);
plot(rho,y2);
xlabel('Radio');
ylabel('Campo Electrico');
title('Desplazamiento Electrico vs Distancia')
% for i = length(rho)
%     if rho(i) < 1
%         Y(i) = D1(i);
%     elseif ((rho(i)> 1) && (rho(i)<2))
%         y(i) = D2(i);
%     elseif (())
%         
%         
%     end
%     
% end



