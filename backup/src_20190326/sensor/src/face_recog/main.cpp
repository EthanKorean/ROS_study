
#include <QCoreApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QUrl>
#include <QString>
#include <QQuickWindow>
#include <QtQml>
#include <QtConcurrent/QtConcurrent>
#include <QtCore>
#include "../../include/face_recog/main_window.h"

/*****************************************************************************
** Main
*****************************************************************************/

int main(int argc, char **argv) {
    ros::init(argc,argv,"Face_Recoginition_Sensor");
    QGuiApplication app(argc,argv);
    Main::MainWindow mw;
    QQmlApplicationEngine engine(&app);
    QFutureWatcher<void> rosThread;
    rosThread.setFuture(QtConcurrent::run(&ros::spin));
    QObject::connect(&rosThread, &QFutureWatcher<void>::finished, &app, &QCoreApplication::quit);
    QObject::connect(&app, &QCoreApplication::aboutToQuit, [](){ros::shutdown();});
    engine.rootContext()->setContextProperty("mw",&mw);
    engine.load(QUrl("qrc:///qml/main.qml"));
     return app.exec();
}//main
