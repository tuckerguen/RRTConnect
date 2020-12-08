function no_collision = local_planner(q1, q2, ws, step_size)
    delta_q = config_diff(q1, q2);
    num_steps = ceil(norm(delta_q)/step_size);
    step = delta_q / num_steps;
    no_collision = true;
    q = q1;
    for i=1:num_steps
        q.th = q.th + step;
        q.draw();
        no_collision = ~check_config_collision(q, ws);
    end