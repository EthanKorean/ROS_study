import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.2


Window {

    width:600
    height:400
    visible:true
    Face{
        id:face
        visible: true;
        opacity: 1
    }//Face
    GuideMenu{
        id:menu;
        visible: false;
        opacity: 0
    }//Face

    Connections{
        target: mw
        onFaceRecogFlag:{
            face.isRecognized(flag);
             sensOff.running=false;
            sensOn.running=false;
            if(flag){
                menu.visible=true
                sensOn.running=true;
            }else{

                sensOff.running=true;
                menu.visible=false;
            }//else
        }//onFaceRecogFlag
    }//Connections

//////////////////////////////////////////////////////
/////////////////////////// ON
//////////////////////////////////////////////////////
    Timer{
        id:sensOn
        interval: 2000
        repeat: false;
        running:false;
        onTriggered: {
            faceScaleDown.running=true;
            faceUpY.running=true;
            showMenu.running=true;
        }
    }
    PropertyAnimation{
        id: showMenu
        target: menu
        properties: "opacity"
        duration: 1000

        to:1.0
        running:false
    }//PropertyAnimation

    NumberAnimation {
        id: faceScaleDown
        target: face
        property: "scale"
        duration: 500
        to:0
        running: false;
    }
    NumberAnimation {
        id: faceUpY
        target: face
        property: "y"
        duration: 200
        to:0
        easing.type: Easing.InOutQuad
        running: false;
    }

//////////////////////////////////////////////////////
/////////////////////////// OFF
//////////////////////////////////////////////////////
    Timer{
        id:sensOff
        interval: 0
        repeat: false;
        running:false;
        onTriggered: {
            faceScaleUp.running=true;
            faceOpaUp.running=true;
            hideMenu.running=true;

        }
    }
    NumberAnimation {
        id: faceScaleUp
        target: face
        property: "scale"
        duration: 300
        to:1
        running: false;
    }
    NumberAnimation {
        id: faceOpaUp
        target: face
        property: "opacity"
        duration: 1000
        to:1
        running: false;
    }
    PropertyAnimation{
        id: hideMenu
        target: menu
        properties: "opacity"
        duration: 400
        to:0.0
        running:false
    }//PropertyAnimation

}//Window
