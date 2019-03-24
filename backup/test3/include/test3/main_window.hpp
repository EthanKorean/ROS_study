/**
 * @file /include/test3/main_window.hpp
 *
 * @brief Qt based gui for test3.
 *
 * @date November 2010
 **/
#ifndef test3_MAIN_WINDOW_H
#define test3_MAIN_WINDOW_H

/*****************************************************************************
** Includes
*****************************************************************************/

#include <QtGui/QMainWindow>
#include "ui_main_window.h"
#include "qnode.hpp"
/*****************************************************************************
** Namespace
*****************************************************************************/

namespace test3 {

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
        void showReady();
        void showWelcome();
        void showMenu();

private:
        QNode qnode;
        Ui::MainWindowDesign ui;
        QString readyImgFile;
        QString welcomeImgFile;
        QImage  readyImg;
        QImage  welcomeImg;
        QLabel  * imgLbl;
        void hideMenu();
        QTimer *timer;
};

}  // namespace test3

#endif // test3_MAIN_WINDOW_H
