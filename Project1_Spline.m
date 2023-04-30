% Project 1: Spline
% Author: WangHaoZhe 522072910008
% Create Date: 2023/3/18
% Submit Date: 2023/4/30

%% Question 1
% Curve 1
x1 = [1, 2, 5, 6, 7, 8, 10, 13, 17];
y1 = [3.0, 3.7, 3.9, 4.2, 5.7, 6.6, 7.1, 6.7, 4.5];
v11 = 1; v1n = -2/3;
% Curve 2
x2 = [17, 20, 23, 24, 25, 27, 27.7];
y2 = [4.5, 7.0, 6.1, 5.6, 5.8, 5.2, 4.1];
v21 = 3; v2n = -4;
% Curve 3
x3 = [27.7, 28, 29, 30];
y3 = [4.1, 4.3, 4.1, 3.0];
v31 = 1/3; v3n = -3/2;

% Plot spline curve
splineplot(x1,y1,v11,v1n);
splineplot(x2,y2,v21,v2n);
splineplot(x3,y3,v31,v3n);

%% Question 2
% Curve 1
coeff1 = splinecoeff(x1,y1,v11,v1n);
coeff2 = splinecoeff(x2,y2,v21,v2n);
coeff3 = splinecoeff(x3,y3,v31,v3n);

beziercurve(x1,y1,coeff1);
beziercurve(x2,y2,coeff2);
beziercurve(x3,y3,coeff3);

%% Question 3
img = imread('dog.jpg');
min_x = 0;
max_x = 52.5;
min_y = 0;
max_y = 10;
imagesc([min_x max_x], [min_y max_y], img); 
hold on;
[points,v1,vn] = bezierdraw;
x = [points(:,1)]';
y = [points(:,2)]';
pause(3);
splineplot(x,y,v1,vn);
