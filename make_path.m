function path = make_path(Ta, Tb, q_connect)
    first_half = Path();
    Ta.root.nearest(q_connect, Config([0,0,0]), realmax, first_half);
    first_half.insert(q_connect);
    
    second_half = Path();
    Tb.root.nearest(q_connect, Config([0,0,0]), realmax, second_half);
    reversed = flip(second_half.configs);
    
    first_half.configs = [first_half.configs, reversed];
    path = first_half;
   
    