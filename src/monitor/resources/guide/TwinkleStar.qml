import QtQuick 2.0
import QtGraphicalEffects 1.0

Item{
    property real starX:Math.ceil(Math.random()*parent.width)
    property real starY:Math.ceil(Math.random()*parent.height)
    property real brightDuration:1500
    property real darkDuration:500
    property real pauseDuration:1500
    property real timerStdInterval:brightDuration+darkDuration+pauseDuration
    property real randomInterval:Math.ceil(Math.random()*(timerStdInterval));
    id:twinkle_star
    visible: true
    x:starX
    y:starY
    width: 7
    height: 7
    opacity:0
    RadialGradient{
        anchors.fill:parent
        gradient: Gradient{
           GradientStop{
              position: 0.1
              color: Qt.rgba(1,1,1,1);
           }//GradientStop
           GradientStop{
              position: 0.2
              color: Qt.rgba(1,1,1,0.3);
           }//GradientStop
           GradientStop{
               position:0.3
               color: Qt.rgba(1,1,1,0.1);
           }//GradientStop
           GradientStop{
               position:0.4
               color: Qt.rgba(1,1,1,0);
           }//GradientStop
        }//Gradient
    }//RadialGradient

    Timer{
        interval: randomInterval;
        running:true;
        repeat: true
        onTriggered:{
            //if(Math.ceil(Math.random()*2)%2==0){
                starX = Math.ceil(Math.random()*menu_frame.width)
                starY = Math.ceil(Math.random()*menu_frame.height)
                randomInterval=timerStdInterval+Math.ceil(Math.random()*1000);
                twinkle.running=true;
            //}//end if
        }//onTriggered
    }//Timer

    SequentialAnimation{
        id:twinkle
        PropertyAnimation {
            targets: twinkle_star
            properties: "opacity"
            duration: brightDuration
            to:1
        }//PropertyAnimation

        PauseAnimation {
            duration: pauseDuration
        }
        PropertyAnimation {
            targets: twinkle_star
            properties: "opacity"
            duration: darkDuration
            to:0
        }//PropertyAnimation
    }//SequentialAnimation
}//item
