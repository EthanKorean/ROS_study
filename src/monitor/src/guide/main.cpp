

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
    ros::init(argc,argv,"guide");
    QGuiApplication app(argc,argv); 
    Main::MainWindow mw;
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("face_sensor",2,&Main::MainWindow::receiveFaceSensMsg,&mw);
    ros::Publisher pub =  nh.advertise<std_msgs::String>("target",20);
    mw.setPub(pub);
    mw.setSub(sub);
    QQmlApplicationEngine engine(&app);
    QFutureWatcher<void> rosThread;
    rosThread.setFuture(QtConcurrent::run(&ros::spin));
    engine.rootContext()->setContextProperty("mw",&mw);
    engine.load(QUrl("qrc:///qml/main.qml"));
    QObject::connect(&rosThread, &QFutureWatcher<void>::finished, &app, &QCoreApplication::quit);
    QObject::connect(&app, &QCoreApplication::aboutToQuit, [](){ros::shutdown();});

    return app.exec();

}//main

