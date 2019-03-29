import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    width:parent.width
    height: parent.height-50
    y:50
    visible: true

    RadialGradient{
        anchors.fill:parent
        gradient:Gradient{
            GradientStop{position:0.5; color:Qt.rgba(0.80,0.949,0.474,1)}
            GradientStop{position:0.1; color:"white"}
        }//Gradient
    }//RadiaGradient
    Column{
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;

        GuideMenuBtn{
            txt:"Air Gate"
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
