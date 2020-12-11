function [result, q_connect] = RRTExtendMultiple(Tb, q_target, ws, step_len, step_size)
    q_connect = Config([0,0,0]);
    % Find nearest node in tree to newest added node to other tree
    q_near = Tb.nearest(q_target);
    % Limit distance from target to nearest
    q_int = limit_dist(q_target, q_near, step_len);
    q_last = q_near;
    % Compute num steps between target and near point
    num_steps = ceil(norm(config_diff(q_target, q_near).th)/step_len);
    % Attempt to extend this tree from q-near to q-target
    for i=1:num_steps
        % One step extension
        result = local_planner(q_int, q_last, ws, step_size);
        if result
            % If extended, insert 
            Tb.insert(q_int);
            q_connect = q_int;
            % If more steps to go, increment configs 
            if i < num_steps
                q_last = q_int;
                % Step towards target
                q_int = limit_dist(q_target, q_int, step_len);
            end
        else
            break;
        end
    end