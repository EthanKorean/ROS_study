#include "../../include/face_recog/main_window.h"



namespace Main {

    MainWindow::MainWindow(){
        ROS_INFO("Step 1 :: ROS init complete");
        pub=nh_pub.advertise<std_msgs::Bool>("face_sensor",2);
        sub=nh_sub.subscribe("finish_nav",2,&MainWindow::recevieFinishFlag,this);
        ROS_INFO("Step 2 :: Pub setting complete");
        QObject::connect(this,SIGNAL(signalFlag(bool)),this,SLOT(slotFlag(bool)));
    }//MainWindow()

    MainWindow::~MainWindow(){
        if(ros::isStarted()){
            ros::shutdown();
            ros::waitForShutdown();
        }//end if
    }//~MainWindow();

    void MainWindow::recevieFinishFlag(const std_msgs::Bool::ConstPtr& flag){
       bool data = flag->data;
        emit signalFlag(!data);
    }//end

    void MainWindow::slotFlag(const bool& flag){
        std_msgs::Bool msg;
        msg.data=flag;
        pub.publish(msg);
        ros::spinOnce();
        ROS_INFO("Send message \"%s\"", flag ? "true" : "false" );
    }//slotFlag


}//namespace