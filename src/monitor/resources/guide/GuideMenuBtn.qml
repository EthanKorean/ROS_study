import QtQuick 2.0

Rectangle{
    property string txt: ""
    property string img: ""
    property int msg:0;
    width: 290
    height: 70
    property real xGap: 30
    property real yGap: 30
    color: Qt.rgba(0,0,0,0)


    Rectangle {
        id: item
        width:parent.width-xGap
        height:parent.height-yGap
        radius: 120;
        x:xGap/2
        y:yGap/2
        color:Qt.rgba(0.525,0.898,0.498,1)
        Rectangle {
                width:parent.width-2
                height:parent.height-2
                radius: 120;
                x : 1
                y : 0
                color : mouseArea.containsMouse? Qt.rgba(0.807,0.984,0.788,1) : "white"
            Text{
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                text: txt
            }//Text
        }//Rectangle

    }//Rectangle
    Rectangle{
        x:0
        y:0
        width:  parent.height-yGap/2
        height: parent.height-yGap/2
        radius:180
        color: item.color

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
