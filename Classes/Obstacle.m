classdef Obstacle
    %Obstacle circular obstacle
    
    properties
        c(2,1) % Center of the circle
        r      % radius of the circle
    end
    
    methods
        function obj = Obstacle(center, radius)
            %Obstacle Construct an instance of this class
            obj.c = center;
            obj.r = radius;
        end
    end
end

