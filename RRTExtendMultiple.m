function [result, q_connect] = RRTExtendMultiple(Tb, q_target, ws, step_len, step_size)
    q_connect = Config([0,0,0]);
    q_near = Tb.nearest(q_target);
    q_int = limit_dist(q_target, q_near, step_len);
    q_last = q_near;
    num_steps = ceil(norm(config_diff(q_target, q_near).th)/step_len);
    for i=1:num_steps
        [result,p] = local_planner(q_int, q_last, ws, step_size);
        delete(p);
        if result
            Tb.insert(q_int);
            q_connect = q_int;
            if i < num_steps
                q_last = q_int;
                q_int = limit_dist(q_target, q_int, step_len);
            end
        else
            break;
        end
    end