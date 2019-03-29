import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle{
    property string txt: ""
    property string img: ""
    property real msg:0
    property real xGap: 30
    property real yGap: 25

    width: 250
    height: 70
    x:parent.width/2-width/2
    color: Qt.rgba(1,1,1,0)
    Rectangle{
        id:inner
        width:parent.width-xGap;
        height:parent.height-yGap;
        x:xGap
        y:yGap
        radius:120
        color: mouseArea.containsMouse ? Qt.rgba(0.7,0.7,0.7,0.25): Qt.rgba(0.25,0.25,0.25,0.5)
        Text{
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter: parent.verticalCenter;
            color:"white"
            text: txt
        }//Text

    }
    Rectangle{
        x:0
        y:0
        width:  parent.height-yGap/2
        height: parent.height-yGap*2/3
        color:  mouseArea.containsMouse ?Qt.rgba(0.7,0.7,0.7,0.25): Qt.rgba(0.25,0.25,0.25,0);
        visible : mouseArea.containsMouse ? true:false
        radius:100
        Image{
            width:64
            height: 64
            source:img
        }
    }
    MouseArea{
        id:mouseArea
        anchors.fill : parent
        cursorShape : Qt.PointingHandCursor
        hoverEnabled: true
        onClicked: mw.startGuide(msg);
    }//MouseArea

}//Rectangle
