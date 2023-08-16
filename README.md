# Create user-defined point cloud using LCD diffraction mask

A plane wave that passes through a sinusoidal Fresnel zone plate includes a component corresponding to a converging spherical wave. This creates a bright spot at a distance $f$ from the diffraction mask. The transmission function is

$$T(x, y) = [\frac{1}{2} + \frac{1}{2} \cos(k \sqrt{x^2 + y^2 + f^2})]^2$$

which is square of the transmitted amplitude

$$A(x, y) = \frac{1}{2} + \frac{1}{2} \cos(k \sqrt{x^2 + y^2 + f^2})$$

Notice how the cosine can be written as a sum

$$\cos(k \sqrt{x^2 + y^2 + f^2}) = \frac{1}{2} (e^{i k \sqrt{x^2 + y^2 + f^2}} + e^{-i k \sqrt{x^2 + y^2 + f^2}})$$

The second term is the wave front of a converging spherical wave and will create a point source at a distance of $f$ in front of the mask. The first term is the wave front of a diverging spherical wave and will create the virtual image of a point source at a distance of $f$ behind the mask.

In general, one can superpose the amplitude functions that correspond to point sources at different locations and create an arbitrary, user-defined 3D point cloud. The required diffraction masks can be computed using MATLAB. One can then realize these diffraction masks using an LCD display. When the display is illuminated using a laser, the 3D point cloud -- along with the inverted, virtual point cloud behind the LCD -- will be realized.

The main program is pointcloud.m, which generates diffraction masks for a user-defined point cloud. Other .m scripts are helper functions. Some examples of diffraction masks are in the folder "examples".

## Laser safety

DO NOT LOOK INTO THE LASER unless you have sufficiently reduced the laser intensity using ND filters AND you are wearing the correct goggles for the laser you are using. You may also want to put the point cloud off the main axis, so that when you observe the point cloud you won't be looking directly into the laser.

## Generalization

There are many ways to generalize the project. For example:

1. Consider using sin instead of cos or more generally cos(... + constant phase). This adds a constant phase shift to the spherical waves.

2. The formula for $T(x, y)$ above assumes different points in the point cloud are in-phase. What can you do if you give different points different phases?

3. A point cloud uses points to make out a shape. What if you use other elements, such as lines, squares, or other geometric shapes, as building blocks? Can you write a word that hovers mid-air?

4. What if you play with the amplitudes of the points in your point cloud (or other elements) as well as the locations? What can you create?

4. How can you make the point cloud safe to view? Can you help one view one of the point clouds without being distracted by the other (the inverted partner)?
