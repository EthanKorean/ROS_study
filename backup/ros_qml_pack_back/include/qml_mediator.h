#ifndef QML_MEDIATOR_H
#define QML_MEDIATOR_H

#include "ros/ros.h"
#include "std_msgs/String.h"

#include <QObject>
#include <QVariant>
#include <QDebug>

class QMLMediator : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QVariantList strings READ getStrings NOTIFY stringsChanged);
    QVariantList m_strings;

    Q_PROPERTY(QString sstrings READ getSstrings NOTIFY sstringsChanged);
    QString m_sstrings;

public:
    QMLMediator(QObject* parent = nullptr)
    {
        connect(this, &QMLMediator::newString, this, &QMLMediator::newStringSlot);
        connect(this, &QMLMediator::targetString, this, &QMLMediator::targetStringSlot);
    }

    QVariantList getStrings()
    {
        return m_strings;
    }

    QString getSstrings()
    {
      return m_sstrings;
    }

    void addString(const QString& s)
    {
        newString(s);
    }

    //Emit this as a signal to be caught locally in order to prevent race conditions
    void addString(const std_msgs::String::ConstPtr& msg)
    {
        newString("I heard: [" + QString(msg->data.c_str()) + "]");
        targetString(QString(msg->data.c_str()));
    }

signals:
    void stringsChanged();
    void newString(QString s);

    void targetString(QString s);
    void sstringsChanged();

private slots:
    void newStringSlot(QString s)
    {
        m_strings.append(s);
        stringsChanged();
    }

    void targetStringSlot(QString s)
    {
        m_sstrings = s;
        sstringsChanged();
    }
};

#endif
