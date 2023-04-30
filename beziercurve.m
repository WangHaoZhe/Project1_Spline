% Plot Bezier curve
% Input: x,y vectors of data points, coefficient from cubic spline
% Output: a figure of Bezier curve
function beziercurve(x,y,coeff)
for i = 1:length(x)-1
    P0 = [x(i),y(i)];
    P1 = [x(i+1),y(i+1)];
    T0 = [1,coeff(i)];
    T1 = [1,coeff(i+1)];
    % Calculate Control Points: C0、C1、C2、C3
    x0 = P0(1);
    x1 = P1(1);
    y0 = P0(2);
    y1 = P1(2);
    dx0 = T0(1);
    dx1 = T1(1);
    dy0 = T0(2);
    dy1 = T1(2);
    C0 = [x0, y0];
    C3 = [x1, y1];
    C1 = C0 + [1/3*dx0, 1/3*dy0];
    C2 = C3 - [1/3*dx1, 1/3*dy1];

    % Plot Bezier Curve
    hold on;
    t = linspace(0,1,100);
    B = [0,0];
    for i=1:100
        B = [B;(1-t(1,i)).^3.*C0 + 3*(1-t(1,i)).^2.*t(1,i).*C1 + 3*(1-t(1,i)).*t(1,i).^2.*C2 + t(1,i).^3.*C3]; % 计算贝塞尔曲线上的点
    end
    plot(B(2:101,1), B(2:101,2));
    quiver(P0(1), P0(2), T0(1), T0(2), 'Color', 'r');
    quiver(P1(1), P1(2), T1(1), T1(2), 'Color', 'r');
    xlim([min(min(B)), max(max(B))]);
    ylim([min(min(B)), max(max(B))]);
end
hold on;