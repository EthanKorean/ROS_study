import QtQuick 2.0
import QtQuick.Controls 1.2
import QtGraphicalEffects 1.0

Rectangle {
    property bool flag: false
    property int speed: 500;
    id:frame
    radius: 120
    color:"black"
    width: 150
    height: 76
    visible: true
    signal signalFlag(bool status);

    RectangularGlow{
        id:effet
        anchors.fill: parent
        glowRadius:0
        spread:0
        color:"yellow"
        cornerRadius: parent.radius + glowRadius
        visible:false;
    }
    Rectangle{
        id:inner
        radius: parent.radius
        color:"white"
        anchors.horizontalCenter:parent.horizontalCenter;
        anchors.verticalCenter:parent.verticalCenter;
        width: parent.width - 10;
        height: parent.height-10;
        visible: true
        Image {
            id: img_btn
            y:1
            x:2
            source: "img/button.png"
            NumberAnimation on x {
                id: on_ani
                from    : 2
                to      : 75
                duration: speed
                running:false;
                // running: false;
            }//else

            NumberAnimation on x {
                id: off_ani
                from    : 75
                to      : 2
                duration: speed
                running:false;
                // running: false;
            }//else

        }//Image
    }//Rectangle

    MouseArea{
        width:parent.width
        height: parent.height
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            if(flag){
                msg.text="Ready.."
                off_ani.running=true;
                effet.visible=false;
            }else{
                msg.text="recognize <b>Face</b>"
                on_ani.running=true;
                effet.visible=true;
            }//end else
            flag=!flag;
            mw.signalFlag(flag);
        }//onClicked
    }//MouseArea

    Connections{
        target: mw
        onFinishGuideSignal:{
            msg.text="Ready.."
            off_ani.running=true;
            effet.visible=false;
            flag=false;
            console.log("is it working?"+flag);
            mw.signalFlag(flag);
        }//finishGuideSignal
    }//Connections

}//Rectangle
