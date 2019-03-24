#include "../../include/guide/main_window.h"

namespace Main{

    MainWindow::MainWindow(){
        ROS_INFO("Step 1 :: ROS init complete");
        ROS_INFO("Step 2 :: Sub setting complete");
        sub = nh.subscribe("face_sensor",2,&MainWindow::receiveFaceSensMsg,this);
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
        switch(msg){
        case 1:
            ROS_INFO("start to guide Air Gate");
            break;
        case 2:
            ROS_INFO("start to guide Toilet");
            break;

        case 3:
            ROS_INFO("start to guide Help Desk");
            break;
        }//end switch
    }//slotsGuide

}//namespace
