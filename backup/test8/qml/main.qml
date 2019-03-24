import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    id:win
    width:256
    height:112

    Button{
        id : sign
        text: "Click me!"
        x:0
        y:0
        width:256
        height:56
        MouseArea{
            anchors.fill:sign
            onClicked: {
                if(mw.test){
                    mw.test=false
                }else{
                    mw.test=true
                }//endelse
            }//onclicked
        }//mouseArea

    }//Button:
    Label{
        id : lbl
        text: {
            if(mw.test){
                "On"
            }else{
                "Off"
            }//end else
        }//text
        x:0
        y:sign.height
        width:256
        height:parent.height -this.y

    }//Label:


    visible: true;
}//Window
