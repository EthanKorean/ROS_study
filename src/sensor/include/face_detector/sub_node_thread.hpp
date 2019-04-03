#ifndef SUB_NODE_THREAD_H
#define SUB_NODE_THREAD_H


#include <QThread>
#include <QObject>
#include <ros/ros.h>
#include <std_msgs/Bool.h>

namespace FaceDetector {

    class SubNodeThread : public QThread{
    Q_OBJECT
    public :
        //variable start ------------------------------

        //variable end ------------------------------
        //method start --------------------------------
        SubNodeThread(ros::NodeHandle nh
                      ,ros::Publisher faceDetPub
                      ,bool *changeStatus);
        ~SubNodeThread();
        void run();
        //method end--------------------------------

    private:
        //variable start ------------------------------
        ros::Publisher mFaceDetPub;
        ros::Subscriber mFinishNaviSub;
        ros::NodeHandle mNh;
        bool *mChangeStatus;
        //variable end ------------------------------
        //method start --------------------------------
        void publishFaceDet(bool flag);
        void recievedFinishedNavi(const std_msgs::Bool::ConstPtr& msg);
        //method end --------------------------------
    };//class
}//namespace
#endif // SUB_NODE_THREAD_H
