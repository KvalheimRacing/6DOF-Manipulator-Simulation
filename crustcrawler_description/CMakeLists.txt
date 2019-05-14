cmake_minimum_required(VERSION 2.8.3)
project(crustcrawler_description)

find_package(catkin REQUIRED roslaunch)
catkin_package()

# Add launch files so they are checked for faults
roslaunch_add_file_check(launch)

install(
	DIRECTORY launch meshes urdf
	DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
	)
