function [success, p] = local_planner(q1, q2, ws, step_size, color)
    delta_q = config_diff(q2, q1).th;
    num_steps = ceil(norm(delta_q)/step_size);
    step = delta_q / num_steps;
    collision = false;
    
    p = [];
    
    q = q1;
    for i=1:num_steps
        q.th = q.th + step;
        if exist('color', 'var')
            p = q.draw(color);
            pause(0.01);
            delete(p);
        end
        if collision
            break;
        end
        collision = collision || check_config_collision(q, ws);
    end
    success = ~collision;