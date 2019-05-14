cmake_minimum_required(VERSION 2.8.3)
project(crustcrawler_msgs)

find_package(catkin REQUIRED
	message_generation
	std_msgs
	geometry_msgs
	)

add_message_files(
	DIRECTORY msg
	FILES
	CircleDescription.msg
	)

generate_messages(
	DEPENDENCIES
	std_msgs
	geometry_msgs
	)

# Tell packages that depend on us that they also need message_runtime
catkin_package(CATKIN_DEPENDS message_runtime)
