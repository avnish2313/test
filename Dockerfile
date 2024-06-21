# Use the official ROS Noetic image
FROM osrf/ros:noetic-desktop-full

# Install necessary packages for GUI support
RUN apt-get update && apt-get install -y \
    x11-apps \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV ROS_MASTER_URI=http://localhost:11311
ENV ROS_IP=localhost

# Source ROS setup script
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# Install any additional ROS packages you need
# RUN apt-get update && apt-get install -y ros-noetic-<your-package>

# Set up entrypoint
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]

