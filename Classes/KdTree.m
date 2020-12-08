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
        
        function obj = insert(obj, node)
            obj.root.insert(node);
        end
        
        function near = nearest(obj, search_node)
            near = obj.root.nearest(search_node, Config([0,0,0]), realmax);
        end
    end
end

