function [ pc ] = make_sphere(rx, ry, rz, theta, phi)

    [Theta, Phi] = meshgrid(theta, phi);
    X = rx * sin(Theta) .* cos(Phi);
    Y = ry * sin(Theta) .* sin(Phi);
    Z = rz * cos(Theta);
    A = ones(length(phi), length(theta));
    pc = [X(:) Y(:) Z(:) A(:)];

end

