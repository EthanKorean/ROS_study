import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    id: root
    width: 400; height: 600
    color: "#000000"
    property bool action: false
    visible: true

    //ready screen
    Item {
        id: ready
        x: 50; y:root.height/2
        width: root.width; height: root.height
        Text {
            text: 'Ready!!'
            color: "white"
            font.bold: true
            font.pointSize: 24
            SequentialAnimation on x {
                loops: Animation.Infinite
                NumberAnimation{ to: 150; duration: 1000}
                NumberAnimation { to: 50; duration: 1000}
            }
        }
    }

    //navi layout
    Grid {
        id:navi_layout
        y: 100
        anchors.margins: 1
        spacing: 2
        columns: 1
        scale: 1
        opacity : 1

        Square {
            id : navi
            width: root.width-2; height: 300
            text: 'navi'
            property int distance: -300

            Image {
                width: parent.width -1
                id: navi_background
                source: 'img/navi_background.png'
                y : navi.distance
                NumberAnimation on y {
                    running: root.action
                    easing.type: Easing.Linear
                    to: 0; duration: 4000
                }
                NumberAnimation on y {
                    running: !root.action
                    easing.type: Easing.Linear
                    to:navi.distance; duration: 300
                }

            }

            //Navi icon
            Image {
                id: triangle
                x: (parent.width - width)/2; y: parent.height -80
                anchors.margins: 1
                transform: Rotation { origin.x: 30; origin.y: 30; axis { x: 1; y: 0; z: 0 } angle: 50 }
                source: 'img/triangle_blue.png'
            }
        }

        Square {
            id : info
            width: root.width-2; height: 200
            anchors.margins: 8

            Square {
                id: target
                width: root.width; height: parent.height/2
                property string target_name: mediator.sstrings

                onTextChanged: start()
                text: 'target : ' + target_name
                anchors.left: parent.left
                anchors.top: parent.top

                function start(){
                    if(target.text == "target : "){
                        ;
                    } else {
                        console.log("target text changed to:", target_name)
                        comment.init()
                        remain_time.init()
                        remain_distance.init()
                        root.action = true
                    }
                }
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
                        if(time == 0){min_timer.running = false}
                    }
                    function init() {
                        console.log("ramain_time init!")
                        time = 4
                        min_timer.running = true
                    }
                    Timer {
                        id:min_timer
                        interval: 1000
                        running: root.action
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
//                    onTextChanged: console.log("distance changed to:", text)

                    function decrement() {
                        distance = distance - 1
                        if(distance == 0){
                            dis_timer.running = false
                            comment.finishUpdate()
                            mediator.finish = true
                            console.log("navi finish:", mediator.finish)
                        }
                    }
                    function init() {
                        distance = 4
                        dis_timer.running = true
                    }
                }
                Timer {
                    id:dis_timer
                    interval: 1000
                    running: root.action
                    repeat: true
                    onTriggered: remain_distance.decrement()
                }
            }
        }
        PropertyAnimation on opacity {
            duration: 300
            to:0
            running: !root.action
        }
        PropertyAnimation on opacity {
            duration: 300
            to:1
            running: root.action
        }
    }

    Square {
        id: comment
        visible: true
        width: root.width; height: 100
        anchors.margins: 1
        text: 'On the way'

        function finishUpdate() {
            comment.text ="You arrived at your destination."
            root.action = false
        }
        function init(){
            comment.text = 'On the way'
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
}
