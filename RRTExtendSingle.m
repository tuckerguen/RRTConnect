function [result, q_target] = RRTExtendSingle(Ta, q_rand, ws, step_len, step_size)
    q_target = Config([0,0,0]);
    % Get nearest node to random node
    q_near = Ta.nearest(q_rand);
    % Limit distance to q_rand from nearest node
    q_int = limit_dist(q_rand, q_near, step_len);
    % Check to see if the two are "connectable"
    [result, p] = local_planner(q_near, q_int, ws, step_size);
    delete(p);
    if result
        % Add node to tree
        Ta.insert(q_int);
        q_target = q_int;
    end