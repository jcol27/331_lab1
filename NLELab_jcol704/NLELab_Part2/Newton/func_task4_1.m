function f = func_task4(x,i)
    switch i
        case 1
            f = x(1)*x(1)-x(2);
        case 2
            f = x(1)*x(1)+x(2)*x(2)-2;
    end
end