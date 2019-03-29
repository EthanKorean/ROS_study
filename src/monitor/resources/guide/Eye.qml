import QtQuick 2.0
import QtGraphicalEffects 1.0


Rectangle {
    property real openEye:400
    property real closeEye: 100
    property real breakTime: 3000
    property real outEyeHeight:140;
    id:outEye
    width:120;
    height: outEyeHeight;
    color : Qt.rgba(0.278,0.65,0.109,0)
    radius: 100

    RadialGradient{
        anchors.fill:parent
        horizontalRadius:100
        verticalRadius:parent.height-5;
        gradient:Gradient{
            GradientStop{position:0.2; color:Qt.rgba(0,0.341,0.4,1)}
            GradientStop{position:0.5; color:Qt.rgba(1,1,1,0)/*Qt.rgba(0.278,0.65,0.109,0)*/}
        }//Gradient

    }//RadiaGradient

    Rectangle{
        id:inEye
        width: parent.height*0.1
        color:Qt.rgba(0.7,0.912,0.956,1)
        height: width
        radius: width/2
        opacity: 0.8

        x:parent.width/3
        y:parent.height/3
        RadialGradient{
            anchors.fill:parent
            gradient:Gradient{
                GradientStop{position:0; color:Qt.rgba(0.2,0.912,0.956,1)}
                GradientStop{position:0.5; color:Qt.rgba(0.2,0.912,0.956,0)}
            }//Gradient
        }//RadiaGradient
        SequentialAnimation{
        running: true;
        id:blink_in;
            PropertyAnimation {
                target: inEye
                properties: "width,height"
                duration: closeEye
                to: 0
            }//PropertyAnimation
            PropertyAnimation{
                target: inEye
                properties: "width,height"
                duration: openEye
                to:inEye.height
            }//PropertyAnimation
        }//SequentialAnimation
    }//Rectangle

    SequentialAnimation{
        id:blink_out
        running: true;
        PropertyAnimation {
            target: outEye
            properties: "height"
            duration: closeEye
            to:2
        }//PropertyAnimation
        PropertyAnimation{
            target: outEye
            properties: "height"
            duration: openEye
            to:outEyeHeight
        }//PropertyAnimation
    }////SequentialAnimation

    Timer{
        interval: breakTime;
        running:true;
        repeat: true
        onTriggered:{
            blink_out.running =true
            blink_in.running  =true
        }//onTriggered
    }//Timer
}//Rectangle

