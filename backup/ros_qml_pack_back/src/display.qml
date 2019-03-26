//import QtQuick 2.5
import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    id: root
    width: 400; height: 600
    color: "#4A4A4A"

    Grid {
        y: 100
        anchors.margins: 1
        spacing: 2
        columns: 1

        Square {
            id : navi
            width: root.width-2; height: 300
//            anchors.top: comment.bottom
//            anchors.margins: 8
            text: 'navi'
            property int distance: -300

            Image {
                width: parent.width -1
                id: navi_background
                source: 'img/navi_background.png'
                y : navi.distance
                NumberAnimation on y {
                    easing.type: Easing.Linear
                    to: 0; duration: 4000
                }
            }

            //Navi icon
            Image {
                id: triangle
                x: (parent.width - width)/2; y: parent.height -80
//                anchors.bottom: parent.bottom
                anchors.margins: 1
                transform: Rotation { origin.x: 30; origin.y: 30; axis { x: 1; y: 0; z: 0 } angle: 50 }
                source: 'img/triangle_blue.png'
            }
        }

        Square {
            id : info
            width: root.width-2; height: 200
//            anchors.topMargin: parent.bottom
            anchors.margins: 8

            Square {
                id: target
                width: root.width; height: parent.height/2
                property string target_name: mediator.sstrings
                text: 'target : ' + target_name
                anchors.left: parent.left
                anchors.top: parent.top
            }


            Square {
                width: root.width/2; height: parent.height/2
                anchors.left: parent.left
                anchors.bottom: parent.bottom

                Text {
                    id: remain_time
                    x: parent.width/2 - 20 ; y : parent.height/2 -10
                    property int time: 4
                    color: "#f0f0f0"
                    text: time + " min"
//                    onTextChanged: console.log("min text changed to:", text)
                    function decrement() {
                        time = time - 1
                        if(time == 1){min_timer.repeat = false}
                    }
                    Timer {
                        id:min_timer
                        interval: 1000
                        running: true
                        repeat: true
                        onTriggered: remain_time.decrement()
                    }
                }
            }

            Square {
                width: root.width/2; height: parent.height/2
                anchors.right: parent.right
                anchors.bottom: parent.bottom

                Text {
                    id: remain_distance
                    x: parent.width/2 - 20 ; y : parent.height/2 -10
                    font.pointSize: 12
                    property int distance: 4
                    color: "#f0f0f0"
                    text: distance + " m"
                    onTextChanged: console.log("distance changed to:", text)

                    function decrement() {
                        distance = distance - 1
                        if(distance == 1){
                            dis_timer.repeat = false
                        } else if(distance == 0){
                            comment.finishUpdate()
                        }
                    }
                }
                Timer {
                    id:dis_timer
                    interval: 1000
                    running: true
                    repeat: true
                    onTriggered: remain_distance.decrement()
                }
            }
        }
    }

    Square {
        id: comment
        width: root.width; height: 100
//            anchors.top: parent.top
//            anchors.fill: parent
        anchors.margins: 1
        text: 'On the way'

        function finishUpdate() {
            comment.text ="You arrived at your destination."
        }

    }


//    ScrollView {
//        anchors.fill: parent
//        anchors.leftMargin: 10
//        anchors.rightMargin: 10
//        anchors.topMargin: 10
//        anchors.bottomMargin: 10

//        ListView {
//            anchors.fill: parent

//            model: mediator.strings
//            delegate: Text {
//                anchors.left: parent.left
//                anchors.right: parent.right
//                height: 25

//                text: modelData
//            }
//        }
//    }
    visible: true

}
