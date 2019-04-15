import QtQuick 2.0
import QtGraphicalEffects 1.0

/**
* Face of Blush
*/


Item {
    width: 150
    height : 75
    opacity:0
    RadialGradient{
        anchors.fill:parent
        gradient:Gradient{
            GradientStop{position:0.0; color:Qt.rgba(0.5,0,0,0.8)}
            GradientStop{position:0.2; color: Qt.rgba(0.5,0,0,0.5)}
            GradientStop{position:0.5; color: Qt.rgba(0.5,0,0,0)}
        }//Gradient
    }//RadiaGradient
}//Rectangle

