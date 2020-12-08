classdef Config
    % CONFIG is a configuration of the 
    % 3 joint arm in T^3
    
    properties
        th(1,3) % Angle of each joint
    end
    
    methods
        function obj = Config(th)
            % CONFIG Construct an instance of this class
            obj.th = th;
        end
        
        function [xs, ys] = getPoints(obj)
            % Get vector of points that define the arm
            x1 = 5*cos(obj.th(1));
            y1 = 5*sin(obj.th(1));
            x2 = x1 + 5 * cos(obj.th(1) + obj.th(2));
            y2 = y1 + 5 * sin(obj.th(1) + obj.th(2));
            x3 = x2 + 5 * cos(obj.th(1) + obj.th(2) + obj.th(3));
            y3 = y2 + 5 * sin(obj.th(1) + obj.th(2) + obj.th(3));
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


