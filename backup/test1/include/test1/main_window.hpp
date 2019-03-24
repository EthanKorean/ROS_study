/**
 * @file /include/test1/main_window.hpp
 *
 * @brief Qt based gui for test1.
 *
 * @date November 2010
 **/
#ifndef test1_MAIN_WINDOW_H
#define test1_MAIN_WINDOW_H

/*****************************************************************************
** Includes
*****************************************************************************/

#include <QtGui/QMainWindow>
#include "ui_main_window.h"
//#include "qnode.hpp"
#include <QLabel>
#ifndef Q_MOC_RUN
#include <ros/ros.h>
#endif
#include "std_msgs/Bool.h"
/*****************************************************************************
** Namespace
*****************************************************************************/

namespace test1 {

/*****************************************************************************
** Interface [MainWindow]
*****************************************************************************/
/**
 * @brief Qt central, all operations relating to the view part here.
 */
class MainWindow : public QMainWindow {
Q_OBJECT

public:
	MainWindow(int argc, char** argv, QWidget *parent = 0);
	~MainWindow();



public Q_SLOTS:
        void on_pushButton_clicked();
protected :

private:
        ros::Publisher sensor;
        bool sign;
	Ui::MainWindowDesign ui;
        QLabel *lbl;
};

}  // namespace test1

#endif // test1_MAIN_WINDOW_H
