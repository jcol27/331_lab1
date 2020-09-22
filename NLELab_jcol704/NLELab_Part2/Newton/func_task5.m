function f = func_task4_2(x,i)
    switch i
        case 1
            f = x(1)*x(1)+x(2)*x(2)+x(3)*x(3)-6;
        case 2
            f = x(1)*x(1)-x(2)*x(2)+2.*x(3)*x(3)-2;
        case 3
            f = 2*x(1)*x(1)+x(2)*x(2)-x(3)*x(3)-3;
    end
end