function modified_X = random_modify_element(X, nlevels)
    [numRows, numCols] = size(X);
    row_idx = randi(numRows); 
    col_idx = randi(numCols);
    modified_X = X; % Create a copy of X
    current_value = modified_X(row_idx, col_idx);
    
    all_possible_values = 1:nlevels(col_idx); % Create an array from 1 to the level value at the current column index.
    all_possible_values(all_possible_values == current_value) = []; % Remove the current value from the possible values array.
    
    new_value_idx = randi(length(all_possible_values)); % Get a random index from the remaining possible values.
    new_value = all_possible_values(new_value_idx);
    
    modified_X(row_idx, col_idx) = new_value;
end
