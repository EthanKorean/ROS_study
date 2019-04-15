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
            GradientStop{id : faceFrame; position:0.5; color:Qt.rgba(0,0,0.250,0.9)}
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

    /////////////////////////////////////////////////////
    function isRecognized(flag){
        if(flag){
            //face detect succes
            ready.running=false;
            readyFrame.running=false;
            welcome.running=true;
            welcomeFrame.running=true;
        }else{
            //face detect fail
            welcome.running=false;
            welcomeFrame.running=false;
            ready.running       =true;
            readyFrame.running =true;
            //face.scale=1;
        }//end else
    }//welcome

//////////////////////////////////////////////////////
/////////////////////////// Face Detect Success
//////////////////////////////////////////////////////

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

//////////////////////////////////////////////////////
/////////////////////////// Face Detect Fail
//////////////////////////////////////////////////////
    PropertyAnimation{
        id: welcomeFrame
        targets: faceFrame
        properties: "color"
        duration: 1500
        to: Qt.rgba(0,0.25,0.25,0.6)
        running:false
    }//PropertyAnimation

    PropertyAnimation{
        id: readyFrame
        targets: faceFrame
        properties: "color"
        duration: 1000
        to: Qt.rgba(0,0,0.250,0.9)
        running:false
    }//PropertyAnimation
}
