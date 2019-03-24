#ifndef MAIN_H
#define MAIN_H


#include "ros/ros.h"
#include "std_msgs/Bool.h"
#include <QObject>
#include <QtCore>

//Main Window Class

namespace test8{
    class MainWindow : public QObject
    {
        Q_OBJECT
        Q_PROPERTY(bool test READ test1 WRITE setTestBoolean NOTIFY testBooleanChanged );
    public:
        MainWindow(QObject* parent = nullptr);
        virtual ~MainWindow();
        bool test1();
        void setTestBoolean(bool value);
    private:
         ros::NodeHandle nh;
         ros::Publisher pub;
         std_msgs::Bool msg;
         bool m_testBoolean;
    signals:
        void testBooleanChanged(const bool value);
     public slots:
        void sign(bool value);
    };//class
}//namespace
#endif
