import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    width:300
    height:200
    visible:true
    //color: Qt.rgba(0.52,0.89,0.49,255)
    color: Qt.rgba(0.91,0.91,0.91,255)
    Text{
        id:subject
        text: qsTr("Face Sensor")
        anchors.horizontalCenter: parent.horizontalCenter;
        y: sensorBtn.y - height-20;
    }//Text::subject

    SensorBtn{
        id:sensorBtn
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;
    }//Button::sensorBtn

    Text{
        id:msg
        height : parent.height - subject.height - sensorBtn.height
        anchors.horizontalCenter: parent.horizontalCenter
        y : sensorBtn.y + sensorBtn.height + 10
        text:qsTr("Ready..")
    }//Text:msg
}//Window
