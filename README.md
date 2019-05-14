# 6DOF-Manipulator-Simulation
This repo contains simulation nodes in ROS for a 6DOF robot arm.
The code is based on [`ROS`](http://ros.org), [Gazebo](http://gazebosim.org) and
[`URDF`](http://wiki.ros.org/urdf).


## Build
To build the packages run:
```bash
$ cd /path/to/your/workspace
$ catkin build
$ source devel/setup.bash
```

## Testing
Once everything is built it is time to test it out. We have included a default
[launch file](http://wiki.ros.org/roslaunch) that starts a bare-minimum robot
with functioning `ROS` control.

```bash
$ roslaunch crustcrawler_gazebo controller.launch
```

From here only the imagination (and bad physics simulation) is the limit!
