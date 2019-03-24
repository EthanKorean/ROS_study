import QtQuick 2.0

Rectangle {
    id:outEye
    width:90;
    height: 100
    color : "black";
    radius: width/2

    property real openEye:400
    property real closeEye: 200
    property real breakTime: 5000


    Rectangle{
        id:inEye
        width: parent.width*0.5
        color:"white"
        height: width
        radius: width/2
        x:8
        y:8
        SequentialAnimation{
            running: true;
            id:blink2;
            PropertyAnimation {
                target: inEye
                properties: "width,height"
                duration: closeEye
                from: inEye.height
                to: 0
            }//PropertyAnimation
            PropertyAnimation{
                target: inEye
                properties: "width,height"
                duration: openEye
                from:0
                to:inEye.height
            }//PropertyAnimation
        }//SequentialAnimation
    }//Rectangle

    SequentialAnimation{
        id:blink
        running: true;
        PropertyAnimation {
            target: outEye
            properties: "height"
            duration: closeEye
            from:100
            to:10
        }//PropertyAnimation
        PropertyAnimation{
            target: outEye
            properties: "height"
            duration: openEye
            from:10
            to:100
        }//PropertyAnimation
    }////SequentialAnimation

    Timer{
        interval: breakTime;
        running:true;
        repeat: true
        onTriggered:{
            blink.running=true;blink2.running=true;
        }//onTriggered
    }//Timer
}//Rectangle
