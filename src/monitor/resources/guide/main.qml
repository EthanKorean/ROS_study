import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtGraphicalEffects 1.0

Window {

    id:window
    width:550
    height:400
    visible:true
    color:Qt.rgba(0.15,0.15,0.15,1)
    RadialGradient{
        anchors.fill:parent
        gradient:Gradient{
            GradientStop{position:0.1; color:Qt.rgba(0,0,0.1,0.86)}
            GradientStop{position:0.3; color:Qt.rgba(0.2,0.2,0.2,0.9)}
            GradientStop{position:0.5; color:Qt.rgba(0,0,0.1,0.4)}
            GradientStop{position:0.6; color:window.color}
            GradientStop{position:0.8; color:Qt.rgba(0,0,0.1,0.86)}
        }//Gradient
    }//RadiaGradient

    GuideMenu{
        id:menu;
        visible: false;
        opacity: 0
    }//Menu

    Face{
        id:face
        visible: true;
        opacity: 1
    }//Face

    Connections{
        target: mw
        onFaceRecogFlag:{
            face.isRecognized(flag);
            sensOff.running=false;
            sensOn.running=false;
            if(flag){
                //Face detect success
                menu.visible=true
                sensOn.running=true;
            }else{
                //Face detect fail
                sensOff.running=true;
                menu.visible=false;
            }//else
        }//onFaceRecogFlag
    }//Connections

//////////////////////////////////////////////////////
/////////////////////////// Face Detect Success
//////////////////////////////////////////////////////
    Timer{
        id:sensOn
        interval: 2000
        repeat: false;
        running:false;
        onTriggered: {
            faceOpaUp.running=false;
            hideMenu.running=false;
            /////////////////////////////////
            showMenu.running=true;

            faceOpaDown.running=true;
        }//onTriggered
    }//Timer:sensOn

    PropertyAnimation{
        id: showMenu
        target: menu
        properties: "opacity"
        duration: 1000
        to:1.0
        running:false
    }//PropertyAnimation


    NumberAnimation {
        id: faceOpaDown
        target: face
        property: "opacity"
        duration: 500
        to:0
        running: false;
    }//NumberAn


//////////////////////////////////////////////////////
/////////////////////////// Face Detect Fail
//////////////////////////////////////////////////////
    Timer{
        id:sensOff
        interval: 0
        repeat: false;
        running:false;
        onTriggered: {
            showMenu.running=false;
            /////////////////////////////////
            faceOpaUp.running=true;
            hideMenu.running=true;
        }//onTriggered
    }//Timer

    NumberAnimation {
        id: faceOpaUp
        target: face
        property: "opacity"
        duration: 500
        to:1
        running: false;
    }//NumberAnimation:faceOpaup

    PropertyAnimation{
        id: hideMenu
        target: menu
        properties: "opacity"
        duration: 400
        to:0.0
        running:false
    }//PropertyAnimation:hideMenu

}//Window
