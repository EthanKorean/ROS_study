/**
 * @file /src/qnode.cpp
 *
 * @brief Ros communication central!
 *
 * @date February 2011
 **/

/*****************************************************************************
** Includes
*****************************************************************************/



#include "../include/test3/qnode.hpp"

namespace test3 {

    QNode::QNode(int argc, char** argv)
    {
        ros::init(argc,argv,"test3");
        start();
    }//QNode

    QNode::~QNode() {
        if(ros::isStarted())
        {
          ros::shutdown(); // explicitly needed since we use ros::start();
          ros::waitForShutdown();
        }
        wait();
    }//~QNode

    void QNode::run()
    {
       ros::NodeHandle nh;
       ros::Subscriber sub;
       sub = nh.subscribe("sensor", 2, &QNode::chatterCallback,this);
       ros::spin();
    }//run

    void QNode::chatterCallback(const std_msgs::Bool::ConstPtr& msg){
        ROS_INFO("%d",msg->data);
        if(msg->data)
        {
            changeWelcome();
        }else
        {
            changeReady();
        }//end else
    }//chatterCallback

    void QNode::changeReady(){
        ROS_INFO("Ready!");
        Q_EMIT signalReady();
    }//statusReady

    void QNode::changeWelcome()
    {
        ROS_INFO("Welcome!");
        Q_EMIT signalWelcome();
    }//statusWelcome

}  // namespace test3
