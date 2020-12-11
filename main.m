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
q0 = Config([0, -0.9273, 0.9273]);
qf = Config([0, 0.9273, -0.9273]);

% Draw initial workspace, start, and goal configs
figure('Position', [10 10 1500 1300])  
ws.draw();
hold on;
q0.draw('black');
qf.draw('black');

% Run RRT-Connect
[result, q_connect, Ta, Tb] = RRTConnect(q0, qf, ws, 10000, 0.3, 0.01);


% Animate path
path = make_path(Ta, Tb, q_connect);
path.animate(ws, 'blue');