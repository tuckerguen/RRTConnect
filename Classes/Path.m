classdef Path < handle
    %PATH A path of configurations as a linked list
    
    properties
        configs (1,:) % Head node of linked list path
    end
    
    methods
        function obj = Path()
            %PATH Construct an instance of this class
            %   Detailed explanation goes here
            obj.configs = [];
        end
        
        function insert(obj, config)
            if isempty(obj.configs)
                obj.configs = [config];
            else
                obj.configs(length(obj.configs)+1) = config;
            end
        end
        
        function draw(obj, color)
            for i=1:length(obj.configs)-1
                obj.configs(i).draw(color);
            end
        end
        
        function animate(obj, ws, color)
            for i=1:length(obj.configs)-1
                obj.configs(i).draw(color);
                local_planner(obj.configs(i), obj.configs(i+1), ws, 0.02, color);
            end
            obj.configs(length(obj.configs)).draw(color);
        end
    end
end

