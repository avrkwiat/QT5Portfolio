import QtQuick 2.8
//import QtQuick.Studio.Effects 1.0

Item {
    id: cpbutton
    width: 120
    height: 50
    property alias mouseArea: mouseArea
    property alias labelText: buttonLabel.text
    property alias buttonState: buttonbg.state
    property alias iconSource: buttonIcon.source
    property alias iconHeigh: buttonIcon.height
    property alias iconWidth: buttonIcon.width

    state: "off"
    //state: (stateName=="base state")? "off":""


    CPbuttonBg {
        id: buttonbg
        anchors.fill: parent
        bgColor: "#343d4e"
    }
    Image {
        id: bgSingleAndCenter

        source: "assets/ButtonIco.png"
        anchors.topMargin: 0
        cache: false
        anchors.fill: parent
        //fillMode: Image.PreserveAspectFit
    }

    Item {
        id: buttonContent
        opacity: 0.5
        anchors.fill: parent


        Image {
            id: buttonIcon
            //visible: cpbutton.labelText === "" ? true : false
            visible:true
            source: ""
            anchors.topMargin: 5
            cache: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: buttonLabel
            y: 10
            height: 29
            //visible: cpbutton.labelText === "" ? false : true
            color: "#000000"
            text: ""
            anchors.bottom: parent.bottom
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            anchors.bottomMargin: 12
            anchors.horizontalCenter: parent.horizontalCenter
            //font.family: Constants.font.family
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

    states: [
        State {
            name: "off"
            PropertyChanges {
                target: buttonbg
                bgColor: "#63708b"
            }

            PropertyChanges {
                target: buttonContent
                opacity: 0.5
            }
        },
        State {
            name: "on"

            PropertyChanges {
                target: buttonbg
                bgColor: "#63708b"
            }

            PropertyChanges {
                target: buttonContent
                opacity: 1
            }

            PropertyChanges {
                target: bgSingleAndCenter
                source: "assets/ButtonIcoON.png"
            }
        },
        State {
            name: "disabled"

            PropertyChanges {
                target: buttonContent
                opacity: 0.15
            }

            PropertyChanges {
                target: mouseArea
                enabled: false
            }
        }
    ]
}
