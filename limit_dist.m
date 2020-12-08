function q_int = limit_dist(q1, q2, step_len)
    % If the new node is too far away
    vec12 = config_diff(q1, q2).th;
    if norm(vec12) > step_len
        % Get direction unit vector from q1 to q2
        d = vec12/norm(vec12);
        % Find point at step_len dist from q1 to q1
        q_int = Config(q1.th + d*step_len);
    else
        q_int = q2;
    end
    