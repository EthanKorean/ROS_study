

#include <QCoreApplication>
#include <QObject>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QUrl>
#include <QString>
#include <QQuickWindow>
#include <QtQml>
#include <QtConcurrent/QtConcurrent>
#include <QFuture>
#include <QFutureWatcher>
#include "mainwindow.h"


int main(int argc, char** argv)
{
    ros::init(argc,argv,"sub");
    ros::NodeHandle node;

    QGuiApplication app(argc,argv);
    test7::MainWindow mw(argc,argv,&app);
    ros::Subscriber sub = node.subscribe("sens",2,&test7::MainWindow::recieveMsg,&mw);
    QFutureWatcher<void> rosThread;
    rosThread.setFuture(QtConcurrent::run(&ros::spin));
    QObject::connect(&rosThread, &QFutureWatcher<void>::finished, &app, &QCoreApplication::quit);
    QObject::connect(&app, &QCoreApplication::aboutToQuit, [](){ros::shutdown();});
    QQmlApplicationEngine engine(&app);
    engine.rootContext()->setContextProperty("mw",&mw);
    engine.load(QUrl("qrc:///qml/main.qml"));
    return app.exec();
}//main
