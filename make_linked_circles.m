function [ pc ] = make_linked_circles(rx, ry, rz, theta)

    x = [rx * cos(theta), zeros(1, length(theta))];
    y = [zeros(1, length(theta)), ry * cos(theta)];
    z = [rz * sin(theta) - rz / 2, rz * sin(theta) + rz / 2];
    a = ones(1, length(x));
    pc = [x', y', z', a'];

end

