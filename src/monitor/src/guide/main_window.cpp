#include "../../include/guide/main_window.h"

namespace Main{

    MainWindow::MainWindow(){

        mSub = mNh.subscribe("face_detect_flag",2,&Main::MainWindow::receiveFaceSensMsg,this);
        mPub =  mNh.advertise<std_msgs::String>("target",20);
        ROS_INFO("Step 1 :: ROS init complete");
        ROS_INFO("Step 2 :: Sub setting complete");
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
        ros::Rate loop_rate(10);

        if(ros::ok()){
            std_msgs::String target;
            if(msg==0)return;
            switch(msg){
            case 10:
                target.data="Hotel";
                break;
            case 20:
                target.data="Toilet";
                break;
            case 30:
                target.data="HelpDesk";
                break;
            }//end switch
            ROS_INFO("start to guide %s",target.data.c_str());
            mPub.publish(target);
            ros::spinOnce();
        }//end if
    }//slotsGuide
}//namespace
