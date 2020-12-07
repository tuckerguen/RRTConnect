classdef Config
    % CONFIG is a configuration of the 
    % 3 joint arm in T^3
    
    properties
        th1        % Angle of 1st joint
        th2        % Angle of 2nd joint
        th3        % Angle of 3rd joint
    end
    
    methods
        function obj = Config(th1, th2, th3)
            % CONFIG Construct an instance of this class
            obj.th1 = th1;
            obj.th2 = th2;
            obj.th3 = th3;
        end
        
        function [xs, ys] = getPoints(obj)
            % Get vector of points that define the arm
            x1 = 5*cos(obj.th1);
            y1 = 5*sin(obj.th1);
            x2 = x1 + 5 * cos(obj.th1 + obj.th2);
            y2 = y1 + 5 * sin(obj.th1 + obj.th2);
            x3 = x2 + 5 * cos(obj.th1 + obj.th2 + obj.th3);
            y3 = y2 + 5 * sin(obj.th1 + obj.th2 + obj.th3);
            xs = [0, x1, x2, x3];
            ys = [0, y1, y2, y3];
        end
        
        function draw(obj)
            % Plot three arm sections
            [xs, ys] = obj.getPoints();
            plot(xs, ys);
        end
    end
end


