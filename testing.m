clear all;
% Include files from subdirectories
p = genpath('./');
addpath(p);
%%
% Configure intiial workspace
o1 = Obstacle([8,0], 2);
o3 = Obstacle([8,8], 2);
o2 = Obstacle([8,-8], 2);
obstacles = [o1; o2; o3];
ws = Workspace(obstacles);
% Initial and final configurations
c0 = Config([0, -0.9, 1]);
c1 = Config([0, 0.9, 1]);
ws.draw()
hold on;
c0.draw();
c1.draw();

for i=1:norm(config_diff(c0, c1).th)*10
    q_int = limit_dist(c0, c1, i/10);
    q_int.draw();
end
% local_planner(c0, c1, ws, 0.1)
c1.draw();
% Draw the workspace and config path


%%
root = KdNode(Config([0,0,0]), NullKdNode(), NullKdNode());
tree = KdTree(root);
tree.insert(KdNode(Config([-1,0,0]), NullKdNode(), NullKdNode()));
tree.insert(KdNode(Config([-1,-1,0]), NullKdNode(), NullKdNode()));
tree.insert(KdNode(Config([-1,1,0]), NullKdNode(), NullKdNode()));
tree.insert(KdNode(Config([1,0,0]), NullKdNode(), NullKdNode()));
tree.insert(KdNode(Config([1,-1,0]), NullKdNode(), NullKdNode()));
tree.insert(KdNode(Config([1,-1,-1]), NullKdNode(), NullKdNode()));
tree.insert(KdNode(Config([1,-1,1]), NullKdNode(), NullKdNode()));

search_config = Config([1,-1,0.5]);
near = tree.nearest(search_config)