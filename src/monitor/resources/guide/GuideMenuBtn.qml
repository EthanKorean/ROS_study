import QtQuick 2.0
import QtGraphicalEffects 1.0
Item{
    property string txt: ""
    property string img: ""
    property real msg:0
    property real xGap: 30
    property real yGap: 25
    property bool active:false;
    //signal toggled
    x:parent.width/2-width/2
    width: 250
    height: active? 140:70;
    id:btn_frame
    Column{
        Rectangle{
            width: 250
            height: 70
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
                onClicked:{

                    active=!active;
                    if(active){
                        mw.startGuide(msg);
                    }//end if

                    //btn_frame.toggled();
                }//onclic
            }//MouseArea

        }//Rectangle
        Rectangle{
            id:alert;
            height:active? 70 :0
            visible: active
            x:parent.width/5
            width:parent.width*3/4;
            color: Qt.rgba(1,1,1,1);
            radius:5
            Column{
                visible:true;
                anchors.fill: parent;
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter;
                    height:alert.height/2
                    wrapMode: Text.WordWrap;
                    text : "Do you want to guide "+txt+"?";
                }
                Row{
                    visible:active;
                    Rectangle{
                        visible:active;
                        width:alert.width/2
                        height:alert.height/2

                        Text{
                            anchors.horizontalCenter: parent.horizontalCenter;
                            anchors.verticalCenter: parent.verticalCenter;
                            text:"yes"
                        }//Text
                        MouseArea{
                            anchors.fill : parent
                            cursorShape : Qt.PointingHandCursor
                            onClicked:{
                                mw.startGuide(msg+1);
                                active=false;
                            }//onclicked
                        }//MouseArea
                    }//Rectangle
                    Rectangle{
                        visible:active;
                        width:alert.width/2
                        height:alert.height/2

                        Text{
                            anchors.horizontalCenter: parent.horizontalCenter;
                            anchors.verticalCenter: parent.verticalCenter;
                            text:"no"
                        }//Text
                        MouseArea{
                            anchors.fill : parent
                            cursorShape : Qt.PointingHandCursor
                            onClicked:{
                                mw.startGuide(9999);
                                active=false;
                            }//onclicked
                        }//MouseArea
                    }//Rectangle
                }//GuideMenu
            }//column
        }//Rectangle
    }//column
}//Item
