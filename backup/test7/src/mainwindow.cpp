

#include "mainwindow.h"
#include <QGuiApplication>
#include <QObject>
#include <QThread>

namespace test7 {


    MainWindow::MainWindow(int argc, char** argv,QObject* parent)
    {
        msgSign=false;
    }//MainWindow

    void MainWindow::recieveMsg(const std_msgs::Bool::ConstPtr& msg)
    {
        msgSign = msg->data;
        if(msg->data)
        {
            qDebug()<<"Go";
            Q_EMIT showMenu();
        }else
        {
            qDebug()<<"End";
            Q_EMIT hideMenu();
        }//end else
    }//recieveMsg

    void MainWindow::guideAirGate()
    {
        ROS_INFO("start to guide AirGate");
    }//print

    void MainWindow::guideToilet()
    {
        ROS_INFO("start to guide Toilet");
    }//print

    void MainWindow::guideHelpDesk()
    {
        ROS_INFO("start to guide Help Desk");
    }//print
}//class
