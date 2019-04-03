#include "../../include/face_detector/camera.hpp"
#include <cv_bridge/cv_bridge.h>
#include <opencv2/opencv.hpp>
#include <iostream>
#include "std_msgs/Bool.h"
#include <thread>


namespace FaceDetector{

    FaceDetector::FaceDetector(){
        mDetectCnt = 0;
        mChangeStatus=false;
        mPub= mNh.advertise<std_msgs::Bool>("face_detect_flag",2);

        // open the default camera
        cv::VideoCapture cap( 0 );
        // check if we succeeded
        if( !cap.isOpened() ) {
            std::cerr << "Could not open camera" << std::endl;
            return ;
        }//end if
        // create a window
        cv::namedWindow( "face_detector", 1 );
        // face detection configuration
        cv::CascadeClassifier face_classifier;
        face_classifier.load( "/opt/opencv/data/haarcascades/haarcascade_frontalface_default.xml" );
        cv::Mat frame;
        start();

        while(true){

            bool frame_valid = true;
            try {
                // get a new frame from webcam
                cap >> frame;
            } catch( cv::Exception& e ) {
                std::cerr << "Exception occurred. Ignoring frame... " << e.err << std::endl;
                frame_valid = false;
            }//end catch
            if( frame_valid ) {
                try {
                    // convert captured frame to gray scale & equalize
                    cv::Mat grayframe;
                    cv::cvtColor( frame, grayframe, CV_BGR2GRAY );
                    cv::equalizeHist( grayframe, grayframe );
                    // -------------------------------------------------------------
                    // face detection routine
                    // a vector array to store the face found
                    std::vector<cv::Rect> faces;
                    face_classifier.detectMultiScale( grayframe, faces,
                                                      1.1, // increase search scale by 10% each pass
                                                      3,   // merge groups of three detections
                                                      CV_HAAR_FIND_BIGGEST_OBJECT|CV_HAAR_SCALE_IMAGE,cv::Size( 30, 30 ));
                    // -------------------------------------------------------------
                    // draw the results
                    for( int i = 0 ; i < faces.size() ; i++ ) {
                        cv::Point lb( faces[i].x + faces[i].width, faces[i].y + faces[i].height );
                        cv::Point tr( faces[i].x, faces[i].y );
                        cv::rectangle( frame, lb, tr, cv::Scalar( 0, 255, 0 ), 3, 4, 0 );
                        mDetectCnt++;
                        std::cout << "face " << std::endl;
                    }//end for
                    // print the output
                    cv::imshow( "face_detector", frame );
                } catch( cv::Exception& e ) {
                    std::cerr << "Exception occurred. Ignoring frame... " << e.err << std::endl;
                }//end catch
            }//end if
            if ( cv::waitKey(30) >= 0 ) break;
            std::cout << "-----------------Round...--------------- " << std::endl;

         }//end while
    }//FaceDetector


    FaceDetector::~FaceDetector(){
        this->quit();
        if(ros::isStarted()){
            ros::shutdown();
            ros::waitForShutdown();
        }//end ros
        this->exit(0);
    }//~MainWindow

    void FaceDetector::run(){
        std::cout << "Thread working!" << std::endl;
        bool faceDetectFlag= false;
        SubNodeThread subNode(mNh,mPub,&mChangeStatus);
        subNode.start();
        while(true){
            msleep(3500);
            if(mDetectCnt>2){
                faceDetectFlag=true;
            }else{
                faceDetectFlag=false;
            }//end if
            if(mChangeStatus!=faceDetectFlag){
                std_msgs::Bool msg;
                mChangeStatus=faceDetectFlag;
                msg.data = mChangeStatus;
                if(ros::ok()){
                    mPub.publish(msg);
                    ros::spinOnce();
                    ROS_INFO("published info ->%s", msg.data?"true":"false");
                }else{
                    std::cout << "ROS is not working... "<< std::endl;
                }//end else
            }//end if
            mDetectCnt=0;
            std::cout << "checked" << std::endl;
        }//end while
    }//run
}//namespace;
