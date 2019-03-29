#include "../../include/face_recog/main_window.h"



namespace Main {

    MainWindow::MainWindow(){
        ROS_INFO("Step 1 :: ROS init complete");
        pub=nh_pub.advertise<std_msgs::Bool>("face_sensor",2);
        sub=nh_sub.subscribe("finish_navi",2,&MainWindow::recieveFinishFlag,this);
        ROS_INFO("Step 2 :: Pub setting complete");
        QObject::connect(this,SIGNAL(signalFlag(bool)),this,SLOT(slotFlag(bool)));
    }//MainWindow()

    MainWindow::~MainWindow(){
        if(ros::isStarted()){
            ros::shutdown();
            ros::waitForShutdown();
        }//end if
    }//~MainWindow();

    void MainWindow::recieveFinishFlag(const std_msgs::Bool::ConstPtr& flag){
         ROS_INFO("Finish_navi  \"%s\"", flag->data ? "true" : "false" );
        emit finishGuideSignal();//connection in SensorBtn.qmlrecieveFinishFlag
    }//recieveFinishFlag

    void MainWindow::slotFlag(const bool& flag){
        ros::Rate loop_rate(10);
        if(ros::ok())
        {
            std_msgs::Bool msg;
            msg.data=flag;

            pub.publish(msg);
            ros::spinOnce();
        }//end if
        ROS_INFO("Send message \"%s\"", flag ? "true" : "false" );
    }//slotFlag


}//namespace
