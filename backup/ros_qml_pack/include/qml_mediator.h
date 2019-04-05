#ifndef QML_MEDIATOR_H
#define QML_MEDIATOR_H

#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Bool.h"

#include <QObject>
#include <QVariant>
#include <QDebug>

class QMLMediator : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString sstrings READ getSstrings NOTIFY sstringsChanged);
    QString m_sstrings;

    Q_PROPERTY(bool finish READ getFinish WRITE setFinish NOTIFY finishChanged);
    bool m_bIsfinish;

    ros::Publisher m_pub;

public:
    QMLMediator(QObject* parent = nullptr)
    {
        connect(this, &QMLMediator::targetString, this, &QMLMediator::targetStringSlot);
    }

    void setPub(ros::Publisher pub){
      m_pub = pub;
    }

    bool getFinish(){
      return m_bIsfinish;
    }

    void setFinish(bool bIsFinish){
      m_bIsfinish = bIsFinish;
      qDebug() << "setFinish : " << bIsFinish;
      finishChanged();
      finishSlot(bIsFinish);
      targetString("");
    }


    QString getSstrings()
    {
      return m_sstrings;
    }

    void addString(const QString& s)
    {
//        newString(s);
    }

    //Emit this as a signal to be caught locally in order to prevent race conditions
    void addString(const std_msgs::String::ConstPtr& msg)
    {
        targetString(QString(msg->data.c_str()));
    }

    void finishSlot(bool bIsfinish){
      qDebug() << "call in  : ";

      ros::Rate loop_rate(10);
      if(ros::ok())
      {
        std_msgs::Bool msg;
        msg.data = bIsfinish;

        m_pub.publish(msg);

        ros::spinOnce();
      }
    }

signals:
    void stringsChanged();

    void targetString(QString s);
    void sstringsChanged();
    void finishChanged();

private slots:
    void targetStringSlot(QString s)
    {
        m_sstrings = s;
        sstringsChanged();
    }
};

#endif
