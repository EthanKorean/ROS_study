import QtQuick 2.0

//Map.qml
Rectangle  {
//    id:root
    width: 400
    height: 700
    color: 'black'

    property bool toiletShow: false
    property bool helpdeskShow: false

    Image {
        id: idAirport_land
        source: 'img/inAirport.png'
        sourceSize.width: root.width -6
        sourceSize.height: 700
    }


    Rectangle {
        id: idtoilet1
        x:17; y:285
        visible: toiletShow

        width: 20
        height: 20
        border.color: "red"
            color: '#333333'

        Image {
            source: 'img/toilet.png'
            sourceSize.width: 20
            sourceSize.height: 20
        }
    }


    Rectangle {
        id: idtoilet2
        x:365; y:60
        visible: toiletShow

        width: 20
        height: 20
        border.color: "red"
            color: '#333333'

        Image {
            source: 'img/toilet.png'
            sourceSize.width: 20
            sourceSize.height: 20
        }
    }

    Rectangle {
        id: idHelpdesk1
        x:145; y:90
        visible: helpdeskShow

        width: 20
        height: 20
        border.color: "red"
            color: '#333333'

        Image {
            source: 'img/help_desk.png'
            sourceSize.width: 20
            sourceSize.height: 20
        }
    }


    Rectangle {
        id: idHelpdesk2
        x:290; y:470
        visible: helpdeskShow

        width: 20
        height: 20
        border.color: "red"
            color: '#333333'

        Image {
            source: 'img/help_desk.png'
            sourceSize.width: 20
            sourceSize.height: 20
        }
    }

    Image {
        id:idCurrentPosition
        x:55; y:390
        source: 'img/finish.png'
        sourceSize.width: 50
        sourceSize.height: 50

        SequentialAnimation {
            id: idPositionAni
            running: true
            loops: Animation.Infinite
            PropertyAnimation { target: idCurrentPosition; property: "source"; to: 'img/current.png'; duration: 700}
            PropertyAnimation { target: idCurrentPosition; property: "source"; to: 'img/finish.png'; duration: 700}
        }

    }

}
