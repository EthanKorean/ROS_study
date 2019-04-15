import QtQuick 2.0
import QtGraphicalEffects 1.0
Item{
    property string txt: ""
    property string img: ""
    property real msg:0
    property real xGap: width*30/250
    property real yGap: height*25/70
    property var mouseId:mouseArea;
    //signal toggled
    x:parent.width/2-width/2
    width: 250
    height:70;
    id:btnFrame
    Column{
        Rectangle{
            width: btnFrame.width
            height: btnFrame.height
            color: Qt.rgba(1,1,1,0)
            Rectangle{
                id:inner
                width:parent.width-xGap;
                height:parent.height-yGap;
                x:xGap
                y:yGap
                radius:120
                color: mouseId.containsMouse ? Qt.rgba(0.7,0.7,0.7,0.25): Qt.rgba(0.25,0.25,0.25,0.5)
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.verticalCenter: parent.verticalCenter;
                    color:"white"
                    text: txt
                }//Text
                MouseArea{
                    id:mouseArea
                    anchors.fill : parent
                    cursorShape : Qt.PointingHandCursor
                    hoverEnabled: true
                    onClicked:{
                            mw.startGuide(msg);
                    }//onclic
                }//MouseArea

            }
            Rectangle{
                x:0
                y:0
                width:  parent.height-yGap/2
                height: parent.height-yGap*2/3
                color:  mouseId.containsMouse ?Qt.rgba(0.7,0.7,0.7,0.25): Qt.rgba(0.25,0.25,0.25,0);
                visible : mouseId.containsMouse ? true:false
                radius:100
                Image{
                    width: parent.height
                    height: parent.height
                    source:img
                }//Image
            }//Rectangle
        }//Rectangle
    }//column
}//Item
