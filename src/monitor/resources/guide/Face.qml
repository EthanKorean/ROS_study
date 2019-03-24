import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    id:face
    anchors.fill: parent
    visible:true;
    color:Qt.rgba(1,0.87,0.69,1);
    //color:Qt.rgba(0.98,0.92,0.77,0.9);
    property int eyeGap:60;
    property real yGap:20
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
            //ready.running=false;
            welcome.running=true;
            }else{
            //welcome.running=false;
            ready.running=true;
            //face.scale=1;
        }//end else
    }//welcome

    PropertyAnimation{
        id: welcome
        targets: [leftBrush , rightBrush,mouth]
        properties: "opacity"
        duration: 1500
        to:1.0
        running:false
    }//PropertyAnimation

    PropertyAnimation{
        id: ready
        targets: [leftBrush , rightBrush,mouth]
        properties: "opacity"
        duration: 1
        to:0.0
        running:false
    }//PropertyAnimation
}
