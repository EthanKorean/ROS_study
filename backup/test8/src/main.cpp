


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
#include <QtCore>
#include "mainwindow.h"


int main(int argc, char** argv)
{
    ros::init(argc, argv, "pub");
    QGuiApplication app(argc,argv);
    test8::MainWindow mw(&app);
    QQmlApplicationEngine engine(&app);
    engine.rootContext()->setContextProperty("mw",&mw);
    engine.load(QUrl("qrc:///qml/main.qml"));

    return app.exec();
}//main
