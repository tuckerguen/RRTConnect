function diff = config_diff(c1, c2)
    diff = Config([angle_diff(c1.th(1), c2.th(1)),...
            angle_diff(c1.th(2), c2.th(2)),...
            angle_diff(c1.th(3), c2.th(3))]);
end