import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    width: 150
    height : 75
    opacity:0
    RadialGradient{
        anchors.fill:parent
        gradient:Gradient{
            GradientStop{position:0.0; color:"red"}
            GradientStop{position:0.5; color:face.color}
        }//Gradient
    }//RadiaGradient
}//Rectangle

