import QtQuick 2.0
import QtQuick.Controls 1.2
import QtGraphicalEffects 1.0

Rectangle {
    property int eyeGap:50;
    property real yGap:0
    id:face
    width:parent.width
    height:parent.height
    visible:true;
    opacity:0.2;
    //color:Qt.rgba(1,0.87,0.69,1);
    //color:Qt.rgba(0.98,0.92,0.77,0.9);


    RadialGradient{
        anchors.fill:parent
        gradient:Gradient{
            GradientStop{position:0.4; color:Qt.rgba(0,0,0.100,0.86)}
            GradientStop{id : face_frame; position:0.5; color:Qt.rgba(0,0,0.250,0.9)}
            GradientStop{position:0.7; color:window.color}
        }//Gradient
    }//RadiaGradient
    Eye{
        x:parent.width/2 - eyeGap-width;
        id:leftEye
        anchors.verticalCenter: parent.verticalCenter
    }//Eye:leftEye
    Eye{
        x : parent.width/2 + eyeGap
        id:rightEye
        anchors.verticalCenter: parent.verticalCenter
    }//Eye:rightEye

    Blush{
        id:leftBrush
        visible: true;
        x : leftEye.x +leftEye.width - eyeGap - width
        y : leftEye.y+leftEye.height+yGap
    }//Blush:leftBrush

    Blush{
        id: rightBrush
        visible: true;
        x : rightEye.x + eyeGap;
        y : rightEye.y+rightEye.height+yGap
    }//Blush:rightBrush

    Mouth{
        id : mouth
        visible:true;
        x : leftEye.x + leftEye.width/2
        y : leftBrush.y + leftBrush.height/2
        width: eyeGap*2+leftEye.width
    }//Mouth:mouth


    /////////////////////////////////////////////////////
    function isRecognized(flag){
        if(flag){
            ready.running=false;
            ready_frame.running=false;
            welcome.running=true;
            welcome_frame.running=true;
        }else{
            welcome.running=false;
            welcome_frame.running=false;
            ready.running       =true;
            ready_frame.running =true;
            //face.scale=1;
        }//end else
    }//welcome

    PropertyAnimation{
        id: welcome
        targets: [leftBrush , rightBrush/*,mouth*/]
        properties: "opacity"
        duration: 1500
        to:1.0
        running:false
    }//PropertyAnimation

    PropertyAnimation{
        id: ready
        targets: [leftBrush , rightBrush/*,mouth*/]
        properties: "opacity"
        duration: 1
        to:0.0
        running:false
    }//PropertyAnimation

    PropertyAnimation{
        id: welcome_frame
        targets: face_frame
        properties: "color"
        duration: 1500
        to: Qt.rgba(0,0.25,0.25,0.6)
        running:false
    }//PropertyAnimation

    PropertyAnimation{
        id: ready_frame
        targets: face_frame
        properties: "color"
        duration: 1000
        to: Qt.rgba(0,0,0.250,0.9)
        running:false
    }//PropertyAnimation
}
