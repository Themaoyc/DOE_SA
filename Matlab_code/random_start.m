function result = random_start(cset, n_alt, nlevels)
    % Initialize an empty cell array to hold data
    data = cell(1, length(nlevels));
    
    % Loop through the levels
    for i = 1:length(nlevels)
        % Generate random data and store it in the cell array
        data{i} = randi([1, nlevels(i)], cset * n_alt, 1);
    end
    
    % Convert the cell array to a matrix
    result = cell2mat(data);
end
