classdef KdTree
    %KDTREE A K-d Tree
    
    properties
        root KdNode % Root of the tree
    end
    
    methods
        function obj = KdTree(root)
            %KDTREE Construct an instance of this class
            root.split = 1;
            obj.root = root;
        end
        
        function obj = insert(obj, config)
            obj.root.insert(KdNode(config, NullKdNode(), NullKdNode()));
        end
        
        function near = nearest(obj, search_node)
            near = obj.root.nearest(search_node, Config([0,0,0]), realmax, Path());
        end
        
        function draw(obj, color)
            obj.root.draw(color);
        end
    end
end

