#include "../../include/face_detector/face_detector.hpp"


int main(int argc,char **argv){
    ros::init(argc,argv,"face_detector");
    FaceDetector::FaceDetector fd;
    return 0;

}//main
