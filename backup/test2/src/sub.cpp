#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Bool.h"

void chatterCallback(const std_msgs::String::ConstPtr& msg)
{
  ROS_INFO("I heard: [%s]", msg->data.c_str());
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "sub2");
  ros::NodeHandle nh;
  ros::NodeHandle nh2;
  ros::Subscriber sub = nh.subscribe("chatter", 1000, chatterCallback);
  ros::Publisher pub;
  std_msgs::Bool sign;


  pub=nh2.advertise<std_msgs::Bool>("sens",2);
  sign.data=true;
  pub.publish(sign);
  ros::spin();

  return 0;
}
