% Create diffraction mask that reproduces a user-defined point cloud

% Distances are in units of mm
%
% Coordinate system:
%                                               y
%                                               |    x
%              <-------------- f -------------> |   /
%                                               |  /
%            |                                  | /
% ------|    |                                  |/
% laser |   LCD                    -------------/------------- z
% ------|    |                                 /|
%            |                                / |
%                                            /  |
%                                           /   |
%                                               |
%
% Point cloud: a matrix of size [n_points, 4] where the four columns are
% x, y, z, and amplitude, respectively.

% Wavelength
lambda = 532e-6;

% Define point cloud

% Sphere
% rx = 5;
% ry = 5;
% rz = 5;
% theta = 0.1 * pi : 0.2 * pi : 0.9 * pi;
% phi = 0 : 0.2 * pi : 1.8 * pi;
% pc = make_sphere(rx, ry, rz, theta, phi);

% Two linked circles
rx = 10;
ry = 5;
rz = 50;
theta = 0 : 0.05 * pi : 1.95 * pi;
pc = make_linked_circles(rx, ry, rz, theta);

% Count the number of points in point cloud
fprintf('Number of points in point cloud: %i\n', size(pc, 1))

% Display point cloud
figure
hold on
scatter3(pc(:, 1), pc(:, 2), pc(:, 3), pc(:, 4));
xlabel('x');
ylabel('y');
zlabel('z');
savefig('pc.fig');
hold off

% Distance from the mask to the point defined by x = y = z = 0
f = 300;

% Pixel coordinates
mask_x = -10 : 8.5e-3 : 10;
mask_y = -5 : 8.5e-3 : 5;
[mask_X, mask_Y] = meshgrid(mask_x, mask_y);

% Make diffraction mask
mask_cos = zeros(length(mask_y), length(mask_x));
mask_sin = zeros(length(mask_y), length(mask_x));
for k = 1 : length(pc(:, 1)) % Loop over points in point cloud
    % Distances between points on mask to the k-th point in point cloud
    mask_R = sqrt((mask_X - pc(k, 1)).^2 + (mask_Y - pc(k, 2)).^2 + (f + pc(k, 3))^2);
    % Update mask
    mask_cos = mask_cos + pc(k, 4) * cos(2 * pi / lambda * mask_R);
    mask_sin = mask_sin + pc(k, 4) * sin(2 * pi / lambda * mask_R);
end

% Rescale
mask_cos = rescale(mask_cos); % rescale to [0, 1]
mask_cos = mask_cos.^2; % square to get intensity
mask_sin = rescale(mask_sin); % rescale to [0, 1]
mask_sin = mask_sin.^2; % square to get intensity

% Write to image
imwrite(mask_cos, 'mask_cos.png')
imwrite(mask_sin, 'mask_sin.png')

