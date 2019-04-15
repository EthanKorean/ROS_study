import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    property bool isHotelListActive:false;
    id:menu_frame
    width:parent.width
    height: parent.height
    y:parent.height - height;
    visible: true


    Repeater{
        model:12
        TwinkleStar{}
    }//Repeater

    Column{
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;

        GuideMenuBtn{
            id:hotel_list_btn
            txt:"Hotels"
            img:"img/hotel.png"
            mouseId:mouseArea
            MouseArea{
                id:mouseArea
                anchors.fill: hotel_list_btn
                cursorShape : Qt.PointingHandCursor
                hoverEnabled: true
                onClicked: {
                    if(isHotelListActive){
                        open_list.running=false;
                        close_list.running=true;

                    }else{

                        open_list.running=true;
                        close_list.running=false;
                    }//end else
                    isHotelListActive=!isHotelListActive;
                }//onClicked
            }//end
        }//GuideMenuBtn

        Row{
            width:hotel_list_btn.width

            Rectangle{
                id:left_margin;
                width: hotel_list_btn.width*4/20
                height:list_penel.height
                opacity: 0;
            }//Rectangle

            Rectangle{
                id:list_penel;
                width:hotel_list_btn.width*29/40
                height:0
                color:Qt.rgba(1,1,1,0.08)
                radius: 5
                Column{
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.verticalCenter: parent.verticalCenter
                    GuideMenuBtn{
                        id:hotel_A
                        visible:isHotelListActive;
                        txt:"Hotel A"
                        img:"img/hotel_a.png"
                        msg:10;
                        width:list_penel.width*2/3
                        height:40
                    }//GuideMenuBtn
                    GuideMenuBtn{
                        id:hotel_B
                        visible:isHotelListActive;
                        txt:"Hotel B"
                        img:"img/hotel_b.png"
                        width:list_penel.width*2/3
                        height:40
                    }//GuideMenuBtn
                    GuideMenuBtn{
                        id:hotel_C
                        visible:isHotelListActive;
                        txt:"Hotel C"
                        img:"img/hotel_c.png"
                        width:list_penel.width*2/3
                        height:40
                    }//GuideMenuBtn
                }//Column
            }//Rectangle
        }//Row

        GuideMenuBtn{
            txt:"Toilet"
            img:"img/toilet.png"
            msg:20
            mouseId: toiletBtn
            MouseArea{
                id:toiletBtn
                anchors.fill: parent
                cursorShape : Qt.PointingHandCursor
                hoverEnabled: true
                onClicked: {
                  open_list.running=false;
                  close_list.running=true;
                  isHotelListActive=false;
                  mw.startGuide(parent.msg)
                }//onClicked
            }//end
        }//GuideMenuBtn

        GuideMenuBtn{
            txt:"Help Desk"
            img:"img/help_desk.png"
            msg:30
            mouseId:helpBtn
            MouseArea{
                id:helpBtn
                anchors.fill: parent
                cursorShape : Qt.PointingHandCursor
                hoverEnabled: true
                onClicked: {
                    open_list.running=false;
                    close_list.running=true;
                    isHotelListActive=false;
                    mw.startGuide(parent.msg)
                }//onClicked
            }//end
        }//GuideMenuBtn


    }//Column


    PropertyAnimation {
        id:open_list
        targets: list_penel
        properties: "height"
        duration: 100
        to:140
        running: false;
    }//PropertyAnimation::open_list

    PropertyAnimation {
        id:close_list
        targets: list_penel
        properties: "height"
        duration: 100
        to:0
        running: false;
    }//PropertyAnimation::close_list

}//Rectange
