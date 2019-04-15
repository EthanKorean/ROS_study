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
            console.log("Transition Start!!!!!")
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
    }
}
