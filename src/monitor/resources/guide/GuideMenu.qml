import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    width:parent.width
    height: parent.height*3/4
    y:parent.height - height;
    visible: true


    Column{
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;

        GuideMenuBtn{
            txt:"Route"
            img:"img/airgate.png"
            msg:1
        }//GuideMenuBtn

        GuideMenuBtn{
            txt:"Toilet"
            img:"img/toilet.png"
            msg:2
        }//GuideMenuBtn

        GuideMenuBtn{
            txt:"Help Desk"
            img:"img/help_desk.png"
            msg:3
        }//GuideMenuBtn
    }//Row
}//Rectange
