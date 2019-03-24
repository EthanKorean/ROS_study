import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    id:win
    width:256
    height:256
    Image{
        id:ready
        source: "images/smile256.png"
        anchors.fill:parent;
        width: parent.width
        height: parent.height
        visible: true

    }//Image/ready
    Image{
        id:welcome
        source: "images/laugh256.png"
        width :parent.width
        height : parent.height
        visible: false;
    }//Image:welcome
    Item{
        id:menu
        width :parent.width
        height : parent.height
        Label{
            id : menuLbl
            x:0
            y:0
            width:parent.width
            height:parent.height/4
            text:"Choise Menu"
        }//Label:menuLbl

        Button{
            id:airgateBtn
            x:0
            y:menuLbl.height
            width:parent.width
            height:parent.height/4
            text:"Air Gate"
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    mw.guideAirGate()
                }//onclicked
            }//mouseArea
        }//Button:airgateBtn
        Button{
            id:toiletBtn
            x:0
            y:airgateBtn.height+airgateBtn.y
            width:parent.width
            height:parent.height/4
            text:"toilet"
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    mw.guideToilet()
                }//onclicked
            }//mouseArea
        }//Button:toiletBtn
        Button{
            id:helpDeskBtn
            x:0
            y:toiletBtn.height+toiletBtn.y
            width:parent.width
            height:parent.height/4
            text:"Help Desk"
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    mw.guideHelpDesk()
                    console.log("Is this really true?")
                }//onclicked
            }//mouseArea
        }//Button:helpDeskBtn
        visible:false
    }//item:menu

    Timer{
        id:timer
        interval: 700
        running:false
        repeat: false
        onTriggered: {
            menu.visible=true
            welcome.visible=false
        }//onTriggered:
    }//Timer

    Connections{
        target: mw
        onShowMenu:{
            ready.visible=false;
            welcome.visible=true;
            timer.running=true;
        }//onShowMenu
        onHideMenu:{
            timer.running=false;
            menu.visible=false;
            welcome.visible=false;
            ready.visible=true;
        }//onHideMenu
    }//Connections

    visible: true
}//Window
