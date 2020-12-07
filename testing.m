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
c0 = Config(0.9, -0.90, 1.5);

collision = check_collision(c0, ws)

% Draw the workspace and config path
ws.draw()
hold on;
c0.draw();