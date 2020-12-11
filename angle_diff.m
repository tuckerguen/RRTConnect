function final = angle_diff(a1, a2)
    diff = a1-a2;
    min_abs = min(abs([diff + 2*pi, diff - 2*pi, diff]));
    if min_abs == abs(diff)
        final = diff;
    elseif min_abs == abs(diff-2*pi)
        final = diff-2*pi;
    else
        final = diff+2*pi;
    end