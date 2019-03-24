#ifndef MAIN_H
#define MAIN_H


#include "ros/ros.h"
#include "std_msgs/Bool.h"

#include <QObject>
#include <QtCore>
#include <QThread>
#include <QTimer>
//Main Window Class

namespace test7{
    class MainWindow : public QObject
    {
        Q_OBJECT


    public:
        MainWindow(int argc, char** argv,QObject* parent = nullptr);
        void recieveMsg(const std_msgs::Bool::ConstPtr& msg);
        Q_INVOKABLE void guideAirGate();
        Q_INVOKABLE void guideToilet();
        Q_INVOKABLE void guideHelpDesk();
    private:
        bool msgSign;
    signals:
        void showMenu();
        void hideMenu();


    };//class
}//namespace
#endif
