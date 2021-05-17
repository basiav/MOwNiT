% f(z) = z^3 - 1
close all; clear all; clc;

% Define function and its' derivative
f = @(Z) Z.^3-1;
fd = @(Z) 3*Z.^2;

roots = [1, -1/2 + 1i*sqrt(3)/2, -1/2 - 1i*sqrt(3)/2];

nx = 1000;
ny = 1000;
xmin = -2;
xmax = 2;
ymin= xmin;
ymax = xmax;

x = linspace(xmin,xmax,nx); y = linspace(ymin,ymax,ny);
[X,Y] = meshgrid(x,y);
Z = X + 1i*Y;

% Number of iterations
n_it = 40;
for n=1:n_it
    Z = Z - f(Z) ./ fd(Z);
end

eps = 0.001;
% Colour points
Z1 = abs(Z-roots(1)) < eps;
Z2 = abs(Z-roots(2)) < eps;
Z3 = abs(Z-roots(3)) < eps;
Z4 = ~(Z1+Z2+Z3);

figure;
map = [1 0 0; 0 1 0; 0 0 1; 0 0 0]; colormap(map);
Z=(Z1+2*Z2+3*Z3+4*Z4);
image([xmin xmax], [ymin ymax], Z);
set(gca,'YDir','normal');

axis equal; axis tight;
set(gca,'XTick',linspace(xmin,xmax,5),'YTick',linspace(ymin,ymax,5));
xlabel('$x$','Interpreter','latex','FontSize',14);
xlabel('$y$','Interpreter','latex','FontSize',14);
title('Fractal from $f(z)=z^3-1$','Interpreter','latex','FontSize',16);