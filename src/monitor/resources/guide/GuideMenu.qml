import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    width:parent.width
    height: parent.height*3/4
    y:parent.height - height;
    visible: true


    Column{
        anchors.horizontalCenter: parent.horizontalCenter;

        GuideMenuBtn{
            txt:"Hotel"
            img:"img/hotel.png"
            msg:10
        }//GuideMenuBtn

        GuideMenuBtn{
            txt:"Toilet"
            img:"img/toilet.png"
            msg:20
        }//GuideMenuBtn

        GuideMenuBtn{
            txt:"Help Desk"
            img:"img/help_desk.png"
            msg:30
        }//GuideMenuBtn
    }//Row
}//Rectange
