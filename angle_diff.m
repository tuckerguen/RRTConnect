function final = angle_diff(a1, a2)
    diff = a1-a2;
    final = min(abs([diff + 2*pi, diff - 2*pi, diff]));