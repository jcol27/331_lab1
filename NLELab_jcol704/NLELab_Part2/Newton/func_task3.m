function f = func_task3(x,i)
    switch i
        case 1
            f = x(1)*x(1)-2*x(1)+x(2)*x(2)+2*x(2)-2*x(1)*x(2)+1;
        case 2
            f = x(1)*x(1)+2*x(1)+x(2)*x(2)+2*x(2)+2*x(1)*x(2)+1;
    end
end