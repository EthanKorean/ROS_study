#include "../../include/guide/main_window.h"

namespace Main{

    MainWindow::MainWindow(){
        ROS_INFO("Step 1 :: ROS init complete");
        ROS_INFO("Step 2 :: Sub setting complete");
        sub = nh.subscribe("face_sensor",2,&MainWindow::receiveFaceSensMsg,this);
        pub = nh.advertise<std_msgs::String>("target",20);
        // QObject::connect(this,SIGNAL(guideSignal(int)),this,SLOT(slotGuide));
    }//MainWindow

    MainWindow::~MainWindow(){
        if(ros::isStarted()){
            ros::shutdown();
            ros::waitForShutdown();
        }//end if
    }//~MainWindow();

    void MainWindow::receiveFaceSensMsg(const std_msgs::Bool::ConstPtr& msg){
        ROS_INFO("%s", msg->data ? "true":"false");
        emit faceRecogFlag(msg->data);
    }//recievFaceSensMsg

    void MainWindow::startGuide(int msg){
        std_msgs::String target;
        switch(msg){
        case 1:
            target.data="Air Gate";
            ROS_INFO("start to guide");
            break;
        case 2:
            target.data="Toilet";
            ROS_INFO("start to guide");
            break;

        case 3:
            target.data="Help Desk";
            break;
        }//end switch
        ROS_INFO("start to guide %s",target.data.c_str());
        pub.publish(target);
        ros::spinOnce();
    }//slotsGuide

}//namespace
