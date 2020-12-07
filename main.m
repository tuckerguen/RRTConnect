clear all;
% Include files from subdirectories
p = genpath('./');
addpath(p);
% Configure intiial workspace
o1 = Obstacle([8,0], 2);
o3 = Obstacle([8,8], 2);
o2 = Obstacle([8,-8], 2);
obstacles = [o1; o2; o3];
ws = Workspace(obstacles);
% Initial and final configurations
c0 = Config(0, -0.9273, 0.9273);
cf = Config(0, 0.9273, -0.9273);
% Run RRT-Connect
% config_path = RRTConnect(c0, cf, ws);
% Draw the workspace and config path
final_path = [c0,cf];
ws.draw()
hold on;
for i=1:length(final_path)
    final_path(i).draw();
end