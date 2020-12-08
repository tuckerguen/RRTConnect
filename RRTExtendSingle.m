function [result, Ta, q_target] = RRTExtendSingle(Ta, q_rand, step_len, step_size)
    q_target = Node(Config(0,0,0), []);
    % Get nearest node to random node
    q_near = Ta.nearest(q_rand);
    % Limit distance to q_rand from nearest node
    q_int = limit_dist(q_near, q_rand, step_len);
    % Check to see if the two are "connectable"
    result = local_planner(q_near, q_int, ws, step_size);
    if result
        % Add node to tree
        Ta.insert(q_int);
        q_target = q_int;
    end