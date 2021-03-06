

#include <QGuiApplication>
#include <QtQml>
#include <QtConcurrent/QtConcurrent>
#include <QtCore>
#include <QCoreApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QUrl>
#include <QString>
#include <QQuickWindow>
#include <QFuture>
#include <QFutureWatcher>

#include "../../include/guide/main_window.h"

int main(int argc,char **argv){

    ros::init(argc,argv,"monitor_guide");
    QGuiApplication app(argc,argv); 
    QQmlApplicationEngine engine(&app);
    QFutureWatcher<void> rosThread;
    rosThread.setFuture(QtConcurrent::run(&ros::spin));
    QObject::connect(&rosThread, &QFutureWatcher<void>::finished, &app, &QCoreApplication::quit);
    QObject::connect(&app, &QCoreApplication::aboutToQuit, [](){ros::shutdown();});

    Main::MainWindow mw;
    engine.rootContext()->setContextProperty("mw",&mw);
    engine.load(QUrl("qrc:///qml/main.qml"));

    return app.exec();

}//main

