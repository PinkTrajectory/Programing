clc
clear
close all

%给定初始点[x0 y0]
p = [-3 -4];

x = p(1);
y = p(2);

f0 = 0;
max_f = 0;

%求取初始点的函数值
f_n = (x - y)^2 + exp((sin(y) - 1)^2)*cos(x) + exp((cos(x) - 1)^2)*sin(y);

%给定优化系数
alfa = 0.001;

while abs(f0 - f_n) > 1.0e-3
    
    %求取偏导数
    dfx = 2*x - 2*y - exp((sin(y) - 1)^2)*sin(x) - 2*exp((cos(x) - 1)^2)*sin(x)*sin(y)*(cos(x) - 1);
    dfy = 2*y - 2*x + exp((cos(x) - 1)^2)*cos(y) + 2*exp((sin(y) - 1)^2)*cos(x)*cos(y)*(sin(y) - 1);
    %由最速下降法寻找最大值对应x,y
    x_n = x + alfa * dfx ;
    y_n = y + alfa * dfy ;
    %更新x,y
    x = x_n ;
    y = y_n ;
    %更新函数值
    f0 = f_n ;
    f_n = (x - y)^2 + exp((sin(y) - 1)^2)*cos(x) + exp((cos(x) - 1)^2)*sin(y);
    
    %防止解超出可行域
    if f_n > max_f
        max_f = f_n ;
        max_x = x;
        max_y = y;
    end
    if x > 0 || x < -5 || y > 0 || y< -5
        break;
    end 
end