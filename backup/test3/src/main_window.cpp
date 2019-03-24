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
#include "../include/test3/main_window.hpp"
#include <QtCore>
#include <QObject>
#include <QTimer>

/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace test3 {

using namespace Qt;

/*****************************************************************************
** Implementation [MainWindow]
*****************************************************************************/

MainWindow::MainWindow(int argc, char** argv, QWidget *parent)
        : QMainWindow(parent),qnode(argc,argv)
    {
        ui.setupUi(this);
        readyImgFile    = "/home/roskinetic/dev/ros/src/test3/resources/images/smile512.png";
        welcomeImgFile  = "/home/roskinetic/dev/ros/src/test3/resources/images/laugh512.png";
        readyImg = QImage(readyImgFile);
        welcomeImg = QImage(welcomeImgFile);
        imgLbl = ui.img;
        showReady();
        QObject::connect(&qnode,SIGNAL(signalReady()),this,SLOT(showReady()));
        QObject::connect(&qnode,SIGNAL(signalWelcome()),this,SLOT(showWelcome()));
        timer = new QTimer(this);
        QObject::connect(timer,SIGNAL(timeout()),this,SLOT(showMenu()));

    }//

    MainWindow::~MainWindow() {}//~MainWindow()
    void MainWindow::showReady()
    {
        hideMenu();
       imgLbl->setPixmap(QPixmap::fromImage(readyImg));
    }//showReady

    void MainWindow::showWelcome()
    {
        hideMenu();
        imgLbl->setPixmap(QPixmap::fromImage(welcomeImg));
        Q_EMIT timer->start(5);

    }//showWelcome
    void MainWindow::showMenu()
    {
        imgLbl->setVisible(false);
        ui.airGateBtn->setVisible(true);
        ui.toiletBtn->setVisible(true);
        ui.helpDeskBtn->setVisible(true);
    }//showMenu

    void MainWindow::hideMenu()
    {
        imgLbl->setVisible(true);
        ui.airGateBtn->setVisible(false);
        ui.toiletBtn->setVisible(false);
        ui.helpDeskBtn->setVisible(false);
    }//hideMenu

    /*
    void MainWindow::showMenu(){
        imgLbl->setVisible(false);
    }//showMenu
    */
}  // namespace test3


