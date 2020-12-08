function is_collision = check_point_collision(p, ws)
    is_collision = false;

    % Test for collision on each obstacles
    for j=1:length(ws.obstacles)
        circ = ws.obstacles(j);
        % If point is closer to center than radius
        if norm(circ.c - p) <= circ.r
            is_collision = true;
        end
        if is_collision
            break;
        end
    end