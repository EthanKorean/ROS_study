#ifndef face_recog_MAIN_WINDOW_H
#define face_recog_MAIN_WINDOW_H

#include "ros/ros.h"
#include "std_msgs/Bool.h"
#include <QObject>
#include <QtCore>

namespace Main {

class MainWindow : public QObject{
    Q_OBJECT
public:
    MainWindow();
    ~MainWindow();
private:
    ros::NodeHandle nh_pub;
    ros::Publisher  pub;
    ros::NodeHandle nh_sub;
    ros::Subscriber sub;
    void recevieFinishFlag(const std_msgs::Bool::ConstPtr& flag);

public slots:
    void slotFlag(const bool& flag);

signals:
    bool signalFlag(bool flag);

};//class

}//namespace Main

#endif //face_recog_MAIN_WINDOW_H
