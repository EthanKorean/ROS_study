#ifndef face_detector_MAIN_WINDOW_HPP
#define face_detector_MAIN_WINDOW_HPP

#include "ros/ros.h"
#include <QThread>
#include "sub_node_thread.hpp"

namespace FaceDetector{

class FaceDetector : public QThread{
    Q_OBJECT
    public:
        FaceDetector();
        ~FaceDetector();
    private:
        ros::NodeHandle mNh;
        ros::Publisher  mPub;
        int mDetectCnt;
        bool mChangeStatus;
        void run();
};//class
}//namespace
#endif
