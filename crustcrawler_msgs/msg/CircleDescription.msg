# This message describes a circle that is meant to be drawn by the reduced
# Crustcrawler.

# Standard header:
Header header

# Description of the circle to be drawn:
# Origin of the circle
geometry_msgs/Point origin
# Radius of the circle in centimeters
float32 radius
# Number of points describes the total number of points to draw in the circle
# NOTE: Remember that the circle should always be completed
int32 num_points
# The following two arguments describes the orientation of the board using
# axis-angle notation. The angle is in radians
float32 angle
# The axis is a unit vector
geometry_msgs/Vector3 axis
