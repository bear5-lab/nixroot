with (import (fetchTarball https://github.com/lopsided98/nixpkgs/archive/nix-ros.tar.gz) {
  overlays = [
    (import ../../overlays/nix-ros-overlay/overlay.nix)
  ];
});

let 
  python_env = python38.withPackages (python-packages: with python-packages; [
    tqdm
  ]);

in mkShell {
  name ="Robo-D";
  
  buildInputs =  with rosPackages.noetic; [
    python_env

    # ros_base
    catkin
    ros-core
    actionlib
    bond-core
    dynamic-reconfigure
    nodelet-core
    rosbash

    # ros_core
    class-loader cmake-modules common-msgs gencpp geneus
    genlisp genmsg gennodejs genpy message-generation
    message-runtime pluginlib ros ros-comm rosbag-migration-rule
    rosconsole rosconsole-bridge roscpp-core rosgraph-msgs
    roslisp rospack std-msgs std-srvs

    # simulators
    robot gazebo-ros-pkgs rqt-web rqt-common-plugins rqt-robot-plugins
    stage-ros

    # viz
    rviz

    # robot
    control-msgs diagnostics executive-smach filters geometry 
    joint-state-publisher kdl-parser robot-state-publisher
    urdf urdf-parser-plugin xacro

    # perception
    image-common image-pipeline image-transport-plugins laser-pipeline
    perception-pcl vision-opencv

    


  ];


  ROS_HOSTNAME = "localhost";
  ROS_MASTER_URI = "http://localhost:11311";
  TURTLEBOT3_MODEL = "burger";
}
