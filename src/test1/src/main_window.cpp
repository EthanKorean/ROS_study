/**
 * @file /src/main_window.cpp
 *
 * @brief Implementation for the qt gui.
 *
 * @date February 2011
 **/
/*****************************************************************************
** Includes
*****************************************************************************/

#include <QtGui>
#include <QMessageBox>
#include <iostream>
#include "../include/test1/main_window.hpp"
#include <QtCore>


/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace test1 {

using namespace Qt;

/*****************************************************************************
** Implementation [MainWindow]
*****************************************************************************/

MainWindow::MainWindow(int argc, char** argv, QWidget *parent)
        : QMainWindow(parent)
{
	ui.setupUi(this); // Calling this incidentally connects all ui's triggers to on_...() callbacks in this class.
        sign = false;

        QObject::connect(ui.pushButton,SIGNAL(clicked()),this,SLOT(test()));
        ros::init(argc, argv, "why");
        ros::NodeHandle nh;
        sensor = nh.advertise<std_msgs::Bool>("sensor",2);
        lbl = ui.label_4;
}//MainWindow

MainWindow::~MainWindow() {}//~MainWindow
void test1::MainWindow::on_pushButton_clicked()
{
    std_msgs::Bool msg;

    if(sign){
        sign=false;
         msg.data =sign;
        ROS_INFO("end");
        sensor.publish(msg);
        ros::spinOnce();
        lbl->setText("End..");
    }else{
        sign=true;
        msg.data =sign;
        ROS_INFO("start");
        lbl->setText("Start!");
        sensor.publish(msg);
        ros::spinOnce();
    }//end else

}//on_pushButton_clicked



}// namespace test1
