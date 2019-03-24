

#include "mainwindow.h"
#include <QGuiApplication>
#include <QObject>
#include <QtCore>

namespace test8 {


    MainWindow::MainWindow(QObject* parent)
    {

       pub = nh.advertise<std_msgs::Bool>("sens", 2);
       m_testBoolean=false;
       connect(this,&MainWindow::testBooleanChanged,this,&MainWindow::sign);
    }//MainWindow

    MainWindow::~MainWindow()
    {
        ros::shutdown();
    }
    bool MainWindow::test1()
    {
        qDebug()<<"GET :: " <<m_testBoolean;
        return m_testBoolean;
    }//test

    void MainWindow::setTestBoolean(bool value){
        m_testBoolean=value;
        qDebug()<<"SET :: " <<m_testBoolean;
        Q_EMIT testBooleanChanged(value);
    }//test

    void MainWindow::sign(bool value){

        msg.data = value;
        pub.publish(msg);
        qDebug()<<"(SLOT)published :: " <<value;
        ros::spinOnce();
        //return value;
    }//sign

}//class
