import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtWebKit 3.0

Window {
    id: root
    width: 400; height: 700
    color: "#000000"
    property bool action: false
    visible: true
    property string target_name: mediator.sstrings

    onTarget_nameChanged: {
        console.log("target text changed!! : "+target_name)
        idIntroImage.fTransitionStart()
    }

    function nextAction(){
        if(target_name == "Hotel"){
            idWebview.showHotelMap()
        } else if(target_name == "Toilet") {
            idAirport_land.showToilet()
        } else if(target_name == "HelpDesk"){
            idAirport_land.showHelpDesk()
        }

    }
    //ready screen
//    Item {
//        id: ready
//        x: 50; y:root.height/2
//        width: root.width; height: root.height
//        Text {
//            visible: false
//            text: 'Ready!!'
//            color: "white"
//            font.bold: true
//            font.pointSize: 24
//            SequentialAnimation on x {
//                loops: Animation.Infinite
//                NumberAnimation{ to: 150; duration: 1000}
//                NumberAnimation { to: 50; duration: 1000}
//            }
//        }
//    }

    Image{
        x:3;y:3
        id: idIntroImage
        source: "new/prefix1/img/available transition _low/available transition_" + imageName + ".jpg"
        sourceSize.width: root.width
        sourceSize.height: 700
        visible: true

        property int readyframeCount: 17
        property int transitionframeCount: 26
        property int currentFrame: 0
        property string imageName : (currentFrame > 9) ? "000" + currentFrame: "0000" + currentFrame


        onImageNameChanged: {
//            console.log("start!!! currentFrame :"+currentFrame)
            if( currentFrame == 26){
                idIntroImage.stop()
                root.nextAction()
            }
        }

        function fTransitionStart(){
            stop()
            idAni2.start()
            console.log("intro restart!!!!!")
        }
        function stop(){
            currentFrame =0
            idAni.stop()
            idAni2.stop()

        }
        function readyStart(){
            stop()
            restart()
        }

        function restart(){
            console.log("intro restart!!!!!")
            idAni.start()
        }

        SequentialAnimation {
            id: idAni
            running: true
            loops: Animation.Infinite
            PropertyAnimation { target: idIntroImage; property: "currentFrame"; to: idIntroImage.readyframeCount; duration: 3000}
        }
        SequentialAnimation {
            id: idAni2
            running: false

            PropertyAnimation { target: idIntroImage; property: "currentFrame"; to: idIntroImage.transitionframeCount; duration: 3000}
        }
    }

    Rectangle {
        id: idWebview
        visible: false
        opacity: 1
        x:3;y:3
        width: root.width-6; height: root.height

        function showHotelMap(){
            idWebview.visible = true
            idOpacity_screen_on_webview.start()
            idReset_timer_webview.start()
        }

        WebView {
            url: "http://localhost:8080/t_map.html"
            anchors.fill: parent
            onNavigationRequested: {
                // detect URL scheme prefix, most likely an external link
                var schemaRE = /^\w+:/;
                if (schemaRE.test(request.url)) {
                    request.action = WebView.AcceptRequest;
                } else {
                    request.action = WebView.IgnoreRequest;
                    // delegate request.url here
                }
            }
        }
        function reset(){
            console.log("reset webview screen!!!")
            idOpacity_screen_off_webview.start()
            mediator.finish = true
            console.log("navi finish:", mediator.finish)
            idIntroImage.readyStart()
        }

        PropertyAnimation on opacity {
            id:idOpacity_screen_on_webview
            duration: 1000
            to:1
            running: false
        }

        PropertyAnimation on opacity {
            id:idOpacity_screen_off_webview
            duration: 1000
            to:0
            running: false
        }


        Timer {
            id:idReset_timer_webview
            interval: 7000
            running: false
            onTriggered: idWebview.reset()
        }
    }

    Map {
        id: idAirport_land
        x:3;y:3
        visible: false
        opacity: 0

        function showToilet(){
            idAirport_land.visible = true
            idOpacity_screen_on.start()
            toiletShow = true
            helpdeskShow = false
            idReset_timer.start()
        }
        function showHelpDesk(){
            idAirport_land.visible = true
            idOpacity_screen_on.start()
            toiletShow = false
            helpdeskShow = true
            idReset_timer.start()
        }

        function reset(){
            console.log("reset airport screen!!!")
            idOpacity_screen_off.start()
            mediator.finish = true
            console.log("navi finish:", mediator.finish)
//            idAirport_land.visible=false
            idIntroImage.readyStart()
        }

        Timer {
            id:idReset_timer
            interval: 7000
            running: false
            onTriggered: idAirport_land.reset()
        }

        PropertyAnimation on opacity {
            id:idOpacity_screen_on
            duration: 1000
            to:1
            running: false
        }

        PropertyAnimation on opacity {
            id:idOpacity_screen_off
            duration: 1000
            to:0
            running: false
        }

//        NumberAnimation on y {
//            running: root.action
//            easing.type: Easing.Linear
//            to: 0; duration: 4000
//        }
//        NumberAnimation on y {
//            running: !root.action
//            easing.type: Easing.Linear
//            to:navi.distance; duration: 300
//        }

}

//    Image{
//        x:3; y:3
//        id: idJourneyImage
//        source: "new/prefix2/img/Journey Complete _low/Journey Complete_" + imageName + ".jpg"
//        sourceSize.width: root.width
//        sourceSize.height: 700
////        visible: root.journeyAction
//        visible: false

//        property int frameCount: 39
//        property int currentFrame: 0
//        property alias running: idJourneyAni.running
//        property string imageName : (currentFrame > 9) ? "000" + currentFrame: "0000" + currentFrame

//        onImageNameChanged: {
//            console.log("start!!! currentFrame :"+currentFrame)
//            if(currentFrame == frameCount){
//                reset_timer.start()
//            }
//        }

//        function start(){
//            idJourneyAni.start()
//        }
//        function stop(){
//            idJourneyAni.stop()
//            currentFrame = 0
//        }
//        function reset(){
//            console.log("reset!!! currentFrame :"+currentFrame)
//            idJourneyImage.visible = false
//            stop()
//            idIntroImage.restart()
//            mediator.finish = true
//            console.log("navi finish:", mediator.finish)
//        }

//        SequentialAnimation {
//            id: idJourneyAni
//            running: root.journeyAction
//            PropertyAnimation { target: idJourneyImage; property: "currentFrame"; to: idJourneyImage.frameCount; duration: 10000}
//        }

//        Timer {
//            id:reset_timer
//            interval: 5000
//            running: false
//            onTriggered: idJourneyImage.reset()
//        }

//    }

    //navi layout
//    Grid {
//        id:navi_layout
//        y: 100
//        anchors.margins: 1
//        spacing: 2
//        columns: 1
//        scale: 1
//        opacity : 1

//        Square {
//            id : navi
//            width: root.width-2; height: 300
//            text: 'navi'
//            property int distance: -300

//            Image {
//                width: parent.width -1
//                id: navi_background
//                source: 'img/navi_background.png'
//                y : navi.distance
//                NumberAnimation on y {
//                    running: root.action
//                    easing.type: Easing.Linear
//                    to: 0; duration: 4000
//                }
//                NumberAnimation on y {
//                    running: !root.action
//                    easing.type: Easing.Linear
//                    to:navi.distance; duration: 300
//                }

//            }

//            //Navi icon
//            Image {
//                id: triangle
//                x: (parent.width - width)/2; y: parent.height -80
//                anchors.margins: 1
//                transform: Rotation { origin.x: 30; origin.y: 30; axis { x: 1; y: 0; z: 0 } angle: 50 }
//                source: 'img/triangle_blue.png'
//            }
//        }

//        Square {
//            id : info
//            width: root.width-2; height: 200
//            anchors.margins: 8

//            Square {
//                id: target
//                width: root.width; height: parent.height/2
//                property string target_name: mediator.sstrings

//                onTextChanged: start()
//                text: 'target : ' + target_name
//                anchors.left: parent.left
//                anchors.top: parent.top

//                function start(){
//                    console.log("target text changed!!")
//                    if(target.text == "target : "){
//                        ;
//                    } else {
//                        console.log("target text changed to:", target_name)
//                        comment.init()
//                        remain_time.init()
//                        remain_distance.init()
//                        root.action = true
//                    }
//                }
//            }

//            Square {
//                width: root.width/2; height: parent.height/2
//                anchors.left: parent.left
//                anchors.bottom: parent.bottom

//                Text {
//                    id: remain_time
//                    x: parent.width/2 - 20 ; y : parent.height/2 -10
//                    property int time: 4
//                    color: "#f0f0f0"
//                    text: time + " min"
////                    onTextChanged: console.log("min text changed to:", text)
//                    function decrement() {
//                        time = time - 1
//                        if(time == 0){min_timer.running = false}
//                    }
//                    function init() {
//                        console.log("ramain_time init!")
//                        time = 4
//                        min_timer.running = true
//                    }
//                    Timer {
//                        id:min_timer
//                        interval: 1000
//                        running: root.action
//                        repeat: true
//                        onTriggered: remain_time.decrement()
//                    }
//                }
//            }

//            Square {
//                width: root.width/2; height: parent.height/2
//                anchors.right: parent.right
//                anchors.bottom: parent.bottom

//                Text {
//                    id: remain_distance
//                    x: parent.width/2 - 20 ; y : parent.height/2 -10
//                    font.pointSize: 12
//                    property int distance: 4
//                    color: "#f0f0f0"
//                    text: distance + " m"
////                    onTextChanged: console.log("distance changed to:", text)

//                    function decrement() {
//                        distance = distance - 1
//                        if(distance == 0){
//                            dis_timer.running = false
//                            comment.finishUpdate()
//                            mediator.finish = true
//                            console.log("navi finish:", mediator.finish)
//                        }
//                    }
//                    function init() {
//                        distance = 4
//                        dis_timer.running = true
//                    }
//                }
//                Timer {
//                    id:dis_timer
//                    interval: 1000
//                    running: root.action
//                    repeat: true
//                    onTriggered: remain_distance.decrement()
//                }
//            }
//        }
//        PropertyAnimation on opacity {
//            duration: 300
//            to:0
//            running: !root.action
//        }
//        PropertyAnimation on opacity {
//            duration: 300
//            to:1
//            running: root.action
//        }
//    }

//    Square {
//        id: comment
//        visible: false
//        width: root.width; height: 100
//        anchors.margins: 1
//        text: 'On the way'

//        function finishUpdate() {
//            comment.text ="You arrived at your destination."
//            root.action = false
//        }
//        function init(){
//            comment.text = 'On the way'
//        }
//    }

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
