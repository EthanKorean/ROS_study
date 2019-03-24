#include "../../include/face_recog/main_window.h"



namespace Main {

    MainWindow::MainWindow(){
        ROS_INFO("Step 1 :: ROS init complete");
        pub=nh.advertise<std_msgs::Bool>("face_sensor",2);
        ROS_INFO("Step 2 :: Pub setting complete");
        QObject::connect(this,SIGNAL(signalFlag(bool)),this,SLOT(slotFlag(bool)));
    }//MainWindow()

    MainWindow::~MainWindow(){
        if(ros::isStarted()){
            ros::shutdown();
            ros::waitForShutdown();
        }//end if
    }//~MainWindow();

    void MainWindow::slotFlag(const bool& flag){
        std_msgs::Bool msg;
        msg.data=flag;
        pub.publish(msg);
        ros::spinOnce();
        ROS_INFO("Send message \"%s\"", flag ? "true" : "false" );
    }//slotFlag


}//namespace
