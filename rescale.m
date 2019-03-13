function [ rescaled_mat ] = rescale( mat )

    min_v = min(mat(:)); % find min
    max_v = max(mat(:)); % find max
    rescaled_mat = (mat - min_v) / (max_v - min_v); % rescale to [0, 1]

end

