function [dxdt] = f_sim(x, u)
    % ODE for simple approximated magnet levitation
    % m * z_ddot = b_m / z + b_s * i / z -m*g

    %Parameters:
    params;
   
    z = x(1);
    z_dot = x(2);
    i = u;

    a = (b_m /z +b_s*i/z)/m -g;

    dxdt = zeros(2,1);
    dxdt(1) = z_dot;
    dxdt(2) = a;
end
