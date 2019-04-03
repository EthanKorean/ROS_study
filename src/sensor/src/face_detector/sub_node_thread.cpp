#include "../../include/face_detector/sub_node_thread.hpp"

namespace FaceDetector{

    SubNodeThread::SubNodeThread(
            ros::NodeHandle nh
            ,ros::Publisher faceDetPub
            ,bool *changeStatus){
        mFaceDetPub=faceDetPub;
        mNh=nh;
        mChangeStatus=changeStatus;
        ROS_INFO("BIRTH");
    }//SubNodeThread

    SubNodeThread::~SubNodeThread(){
        this->quit();
        exit(0);
    }//~SubNodeThread

    void SubNodeThread::run(){
        mFinishNaviSub = mNh.subscribe("finish_navi",2,&SubNodeThread::recievedFinishedNavi,this);
        while(true){
            ROS_INFO("CHET!!!!!!!!!!!!");
            ros::spin();
        }
        //ROS_INFO("Thread of SubNode is working!");
    }//run

    void SubNodeThread::recievedFinishedNavi(const std_msgs::Bool::ConstPtr& msg){
        ROS_INFO("recieved Topic");
        publishFaceDet(false);
    }//recievedFinishedNavi

    void SubNodeThread::publishFaceDet(bool flag){
        ROS_INFO("published finish flag");
        std_msgs::Bool msg;
        msg.data = flag;
        *mChangeStatus=false;
        if(ros::ok){
            mFaceDetPub.publish(msg);
            ros::spinOnce();
        }//end if
    }//publishFaceDet

}//namespace
