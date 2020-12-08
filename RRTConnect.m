function configs = RRTConnect(c0, cf, ws, max_nodes)
    % Return configuration path from c0 to cf in ws using RRT Connect
    % c0 - The initial configuration
    % cf - The final configuration
    % ws - Workspace of with obstacles
    % max_nodes - Max # nodes to generate before auto-termination
    
    Ta = Node(c0, []);
    Tb = Node(cf, []);
    success = false;
    
    for i=1:max_nodes
        q_rand = Config(rand_range(-pi/2,pi/2,1),...
                        rand_range(-pi/2,pi/2,1),...
                        rand_range(-pi/2,pi/2,1));
        [result, Ta, q_target] = RRTExtendSingle(Ta, q_rand, step_len);
    end
    
