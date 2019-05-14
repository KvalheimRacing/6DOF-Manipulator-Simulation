# CrustCrawler
This repository contains the robot simulation tools for ROBINs CrustCrawlers.
The code is based on [`ROS`](http://ros.org), [Gazebo](http://gazebosim.org) and
[`URDF`](http://wiki.ros.org/urdf).

## Install
Follow the guide on the [wiki](https://github.uio.no/INF3480/crustcrawler_simulation/wiki/Setup).

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
