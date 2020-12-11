function [success, p] = local_planner(q1, q2, ws, step_size, color)
    % Compute diff of config angles
    delta_q = config_diff(q2, q1).th;
    % Steps between configs
    num_steps = ceil(norm(delta_q)/step_size);
    % Individual step length
    step = delta_q / num_steps;
    collision = false;
    q = q1;
    % Step towards q2 until reach q2 or collision
    for i=1:num_steps
        q.th = q.th + step;
        % Draw the arm config at each step
        if exist('color', 'var')
            p = q.draw(color);
            pause(0.01);
            delete(p);
        end
        % Check current config for collision
        collision = check_config_collision(q, ws);
        if collision
            break;
        end
        
    end
    success = ~collision;