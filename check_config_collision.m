function is_collision = check_config_collision(c, ws)
    is_collision = false;
    % Get points defining arm
    [xs, ys] = c.getPoints();
    % For arm segment
    for i=1:length(xs)-1
        p1 = [xs(i); ys(i)];
        p2 = [xs(i+1); ys(i+1)];
        % Vector from start to end
        v12 = (p2 - p1);
        
        % Test for collision on each obstacles
        for j=1:length(ws.obstacles)
            circ = ws.obstacles(j);
            % Vector from center to start
            v1c = (p1 - circ.c);
            % Calc discriminant
            a = dot(v12, v12);
            b = 2*dot(v1c, v12);
            c = dot(v1c, v1c) - circ.r * circ.r;
            disc = b*b-4*a*c;
            
            % If there is a solution
            if disc >= 0
                t1 = (-b - sqrt(disc))/(2*a);
                t2 = (-b + sqrt(disc))/(2*a);
                % if completely inside or intersect circle
                if (t1>=0 && t1<=1) || (t2>=0 && t2<=1)
                    is_collision = true;
                    break
                end
                % Otherwise, no valid solution, no collision, continue
            end
        end
        if is_collision
            break;
        end
    end