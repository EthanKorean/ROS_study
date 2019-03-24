/**
 * @file /include/test3/qnode.hpp
 *
 * @brief Communications central!
 *
 * @date February 2011
 **/
/*****************************************************************************
** Ifdefs
*****************************************************************************/

#ifndef test3_QNODE_HPP_
#define test3_QNODE_HPP_

/*****************************************************************************
** Includes
*****************************************************************************/

// To workaround boost/qt4 problems that won't be bugfixed. Refer to
//    https://bugreports.qt.io/browse/QTBUG-22829
#ifndef Q_MOC_RUN
#include "ros/ros.h"
#include "std_msgs/Bool.h"
#endif
#include <QThread>
#include <QtCore>


/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace test3 {

/*****************************************************************************
** Class
*****************************************************************************/

class QNode : public QThread {
    Q_OBJECT
    public:
            QNode(int argc, char** argv);
            virtual ~QNode();
            void run();
            void chatterCallback(const std_msgs::Bool::ConstPtr& msg);
            void changeReady();
            void changeWelcome();
    Q_SIGNALS:
            void signalReady();
            void signalWelcome();
    private:
            int init_argc;
            char** init_argv;

    };

}  // namespace test3
#endif /* test3_QNODE_HPP_ */
