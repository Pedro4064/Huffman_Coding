classdef Node 
    properties
        probability
        symbol_name
        left_node
        right_node
    end

    methods
        function N = Node(prob, name, left_node, right_node)
            if nargin == 0
                N.probability = 0;
                N.symbol_name = '';
                N.left_node   = nan;
                N.right_node   = nan;
                 
            elseif nargin == 2
                 N.probability = prob;
                 N.symbol_name = name;
                 N.left_node   = nan;
                 N.right_node   = nan;

            elseif nargin == 4
                N.probability = prob;
                N.symbol_name = name;
                N.left_node = left_node;
                N.right_node = right_node;
             end
        end

        function row = ToRow(this)
            row = table();
            
            row.Symbol(1) = this.symbol_name;
            row.Probability(1) = this.probability;
            row.Nodes(1) = {this};
        end
    end

    methods(Static)
        function N = New(prob, name, left_node, right_node)
             if isscalar(prob)
                N = Node(prob, name);

             else
                 N = cell(height(prob), 1); % Create a cell array by pre-allocating
                for index = 1:height(prob)
                    new_node = Node(prob(index), name{index});
                    N{index, 1} = new_node;
                    if nargin ~= 2
                       N{index, 1}.left_node = left_node;
                       N{index, 1}.right_node = right_node;
                    end
                end

                
            end

        end

     end
end