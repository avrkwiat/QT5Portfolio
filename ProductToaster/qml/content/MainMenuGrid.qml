import QtQuick 2.15
import QtQuick.Controls 2.15
import Onlygui5 1.0

Item {
    id: main_menu_grid

    ListModel {
        id: nameModel
        ListElement {
            file: "assets/arrow_right.svg"
            name: "Front"
            text: "Front"
            //enableButton: true
            statButton: "off"
        }
        ListElement {
            file: "assets/favorite.svg"
            name: "Logo"
            text: "Logo"
            statButton: "off"
        }
        ListElement {
            file: "assets/arrow_downward.svg"
            name: "Top"
            text: "Top"
            statButton: "off"
        }
//        ListElement {
//            file: "assets/arrow_back.svg"
//            name: "Back"
//            text: "Back"
//            statButton: "off"
//        }
        ListElement {
            file: "assets/contacts.svg"
            name: "Contact"
            text: "Contact"
            statButton: "off"
        }
        ListElement {
            file: "assets/toggle_on.svg"
            name: "On"
            text: "On"
            statButton: "off"
        }
    }
    Component {
        id: nameDelegate
        Column {
            id: column
            //width: main_menu_grid.width

            CPbutton {
                id: buttonInteriorModel

                x: 20
                height: (main_menu_grid.height/5) -15 //- marginHeigh
                //anchors.topMargin: 25
                width: main_menu_grid.width - 40

                iconHeigh: height / 1.6
                iconWidth: width / 2

                buttonState: "single"
                iconSource: model.file
                labelText: model.text

                state: statButton

                //:
                Connections {
                    target: buttonInteriorModel.mouseArea

                    function  onClicked() {
                        Values.front = false
                        Values.back = false
                        Values.logo = false
                        Values.top = false
                        Values.contact = false
                        Values.on = false
                        //*********change button on OFF********************/
                        var i
                        for (i = 0; i < nameModel.count; i++) {
                          /*  if (statButton == "on") {
                                if (i == model.index) {

                                } else {
                                    //nameModel.get(i).statButton = "off"
                                }
                            }*/ /*else {
                                if (statButton == "off") {
                                    if (i == model.index) {
                                    } else {
                                        nameModel.get(i).statButton = "off"
                                    }
                                }
                            }*/
                            nameModel.get(i).statButton = "off"
                            //console.log(nameModel.get(i).statButton)
                        }
                        //console.log(model.index)
                        //switch (model.index) {
                        switch (model.name) {
                        case "Front":
                            if (!Values.front) {
                                stateName =  "FrontState"
                                //Values.stateValues =  "FrontState"
                                statButton = "on"
                                Values.front = true
                                window.buttonClicked("FrontState On")
                                window.bakeStart("OFF")
                            } else {
                                statButton = "off"
                                Values.front = false
                            }
                        break
                        case "Back":
                            if (!Values.back) {
                                stateName = "BackState"
                                //Values.stateValues =  "BackState"
                                statButton = "on"
                                Values.back = true
                                window.buttonClicked("BackState On")
                                window.bakeStart("OFF")

                            } else {
                                statButton = "off"
                                Values.back = false
                            }

                            break
                        case "Logo":
                            if (!Values.logo) {
                                stateName = "LogoState"
                                //Values.stateValues =  "LogoState"
                                statButton = "on"
                                Values.logo = true
                                window.buttonClicked("LogoState On")
                                window.bakeStart("OFF")
                            } else {
                                statButton = "off"
                                Values.logo = false
                            }
                            break
                        case "Top":
                            if (!Values.top) {
                                stateName = "TopState"
                                //Values.stateValues =  "TopState"
                                statButton = "on"
                                Values.top = true
                                window.buttonClicked("TopState On")
                                window.bakeStart("OFF")
                            } else {
                                statButton = "off"
                                Values.top = false
                            }
                            break
                        case "Contact":
                            if (!Values.contact) {
                                stateName = "ContactState"
                                //Values.stateValues =  "ContactState"
                                statButton = "on"
                                Values.contact = true
                                window.buttonClicked("ContactState On")
                                window.bakeStart("OFF")
                            } else {
                                statButton = "off"
                                Values.contact = false
                            }
                            break
                        case "On":
                            if (!Values.on) {
                                stateName = "OnState"
                                //Values.stateValues =  "OnState"
                                statButton = "on"
                                Values.on = true
                                window.buttonClicked("OnState On")
                                window.bakeStart("ON")

                            } else {
                                statButton = "off"
                                Values.on = false
                            }
                        break
                        default:

                            break
                        }


                    }
                }
            }
        }
    }
    //--> slide
    GridView {
        id: gridButton
        anchors.fill: parent
        anchors.bottomMargin: 8
        model: nameModel
        delegate: nameDelegate
        anchors.topMargin: 6

        clip: true
        cellWidth: main_menu_grid.width
        cellHeight: main_menu_grid.height / 5
//        header: Rectangle {
//            anchors { left: parent.left; right: parent.right }
//            height: 10
//            color: "pink"
//        }
//        footer: Rectangle {
//            anchors { left: parent.left; right: parent.right }
//            height: 10
//            color: "lightblue"
//        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
