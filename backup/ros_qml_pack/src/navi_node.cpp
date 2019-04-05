#include "ros/ros.h"
#include "std_msgs/String.h"

#include <QCoreApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtConcurrent/QtConcurrent>
#include <QQmlContext>
#include <QFuture>
#include <QFutureWatcher>

#include "qml_mediator.h"

int main(int argc, char **argv)
{
  ros::init(argc, argv, "navi_node");
  ros::NodeHandle nh;

  QGuiApplication app(argc, argv);
  QMLMediator mediate(&app);
    ros::Subscriber sub = nh.subscribe("target", 1000, &QMLMediator::addString, &mediate);
    ros::Publisher pub = nh.advertise<std_msgs::Bool>("finish_navi", 2);

  mediate.setPub(pub);
  QFutureWatcher<void> rosThread;
  rosThread.setFuture(QtConcurrent::run(&ros::spin));
  QObject::connect(&rosThread, &QFutureWatcher<void>::finished, &app, &QCoreApplication::quit);
  QObject::connect(&app, &QCoreApplication::aboutToQuit, [](){ros::shutdown();});

  QQmlApplicationEngine engine(&app);
  engine.rootContext()->setContextProperty("mediator", &mediate);
  engine.load(QUrl("qrc:///qml/display.qml"));

  return app.exec();
}
