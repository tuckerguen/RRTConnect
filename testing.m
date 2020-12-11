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
c0 = Config([0, -0.9, 1.2]);
c1 = Config([0, -0.9, 1.8]);
ws.draw()
hold on;
c0.draw('red');
c1.draw('black');

%%
Ta = KdTree(KdNode(c0, NullKdNode(), NullKdNode()));
[result, q_target] = RRTExtendSingle(Ta, c1, ws, 1, 0.01);
% c1.draw();
% Draw the workspace and config path


%%
root = KdNode(Config([0,0,0]), NullKdNode(), NullKdNode());
tree = KdTree(root);
tree.insert(Config([-1,0,0]));
tree.insert(Config([-1,-1,0]));
tree.insert(Config([-1,1,0]));
tree.insert(Config([1,0,0]));
tree.insert(Config([1,-1,0]));
tree.insert(Config([1,-1,-1]));
tree.insert(Config([1,-1,1]));

search_config = Config([1,-1,0.5]);
% near = tree.nearest(search_config)
%%
qf = Config([0, 0.9273, -0.9273]);
cg = Config([0.3, 0.8, -0.1]);
ws.draw();
hold on;
qf.draw('black');
cg.draw('cyan');
local_planner(qf, cg, ws, 0.01);