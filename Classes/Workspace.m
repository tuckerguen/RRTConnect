classdef Workspace
    %WORKSPACE Robot workspace with
    % 3 arm robot centered at origin
    % and list of obstacles
    
    properties
        obstacles(:,1)
    end
    
    methods
        function obj = Workspace(obstacles)
            %WORKSPACE Construct an instance of this class
            obj.obstacles = obstacles;
        end
        
        function draw(obj)
            centers = [obj.obstacles.c]';
            radii = [obj.obstacles.r];
            viscircles(centers, radii);
        end
    end
end

