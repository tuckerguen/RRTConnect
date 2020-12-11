function path = make_path(Ta, Tb, q_connect)
    % Build the path from trees and connect
    
    % Get the path from q_start to q_connect
    first_half = Path();
    Ta.root.nearest(q_connect, Config([0,0,0]), realmax, first_half);
    
    % Get path from q_goal to q_connect
    second_half = Path();
    Tb.root.nearest(q_connect, Config([0,0,0]), realmax, second_half);
    % Reverse to get path from q_connect to q_goal
    reversed = flip(second_half.configs);
    
    % Append the two paths together
    first_half.configs = [first_half.configs, reversed];
    path = first_half;
   
    