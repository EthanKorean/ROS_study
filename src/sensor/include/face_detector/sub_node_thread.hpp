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
        SubNodeThread(ros::NodeHandle nh
                      ,ros::Publisher faceDetPub
                      ,bool *changeStatus);
        ~SubNodeThread();
        void run();
    private:
        ros::Publisher mFaceDetPub;
        ros::Subscriber mFinishNaviSub;
        ros::NodeHandle mNh;
        bool *mChangeStatus;
        void publishFaceDet(bool flag);
        void recievedFinishedNavi(const std_msgs::Bool::ConstPtr& msg);
    };//class
}//namespace
#endif // SUB_NODE_THREAD_H
