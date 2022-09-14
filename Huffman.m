% Read the file containing the data
file_name = input("Insert the Name of the file with the Data: ", "s");
data = readtable("test_1.csv"); %! Later we need to add a try catch

% Now we need to order using the probability and add the Node Column
data = sortrows(data, 'Probability', 'descend');
data.Nodes = Node.New(data.Probability, data.Symbol);

while height(data) ~= 1
    % Get the two symbols with lowest probability
    l_element = data(end - 1, :);
    s_element = data(end, :);

    % Generate the parent node with the summed probability and names
    c_prob = l_element{1, end}{1}.probability + s_element{1, end}{1}.probability;
    c_name = l_element{1, 1}{1} + "+" + s_element{1, 1}{1};

    parent_node = Node(c_prob, c_name, l_element{1, end}{1}, s_element{1, end}{1});

    
    % Remove the last two nodes 
    data([end, end-1], :) = [];

    % Add the new node as table entry and order it
    new_row = parent_node.ToRow();
    data = [data; new_row];
    data = sortrows(data, 'Probability', 'descend')
    
end