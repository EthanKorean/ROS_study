#ifndef mnt_guide_MAIN_WINDOW_H
#define mnt_guide_MAIN_WINDOW_H

#include "ros/ros.h"
#include "std_msgs/Bool.h"
#include "std_msgs/String.h"
#include <QObject>
#include <QtCore>


namespace Main{

class MainWindow : public QObject{
Q_OBJECT
public:
    MainWindow();
    ~MainWindow();
    Q_INVOKABLE void startGuide(int msg);
    void receiveFaceSensMsg(const std_msgs::Bool::ConstPtr& msg);

signals:
    void    faceRecogFlag(bool flag);

private:
    ros::NodeHandle mNh;
    ros::Subscriber mSub;
    ros::Publisher  mPub;

};//class


}// namespace
#endif
