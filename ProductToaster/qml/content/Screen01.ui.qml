
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick3D 1.15
import Onlygui5 1.0
import QtQuick.Timeline 1.0

Rectangle {
    id: mainRectangle

    //property string stateName: "base state"
     property string stateName: Values.stateValues
    readonly property int transitionTime: 500

    width: 800
    height: 600
    color: "#313931"
    border.width: 15

    state: stateName

    Text {
        id: name
        y: 35
        height: 13
        text: qsTr("bake: "+Values.bakeProcentValues)
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 462
        anchors.leftMargin: 280
    }

    Image {
        id: rectangleButton
        source: "assets/backgroundButton.png"

        //color: "#0d0d0d"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 12
        anchors.leftMargin: 12
        anchors.bottomMargin: 12

        MainMenuGrid {
            id: main_Menu
            height: parent.height * 0.9
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.topMargin: 25
        }
    }

    View3DScen {
        id: view3D
        anchors.fill: parent
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        anchors.centerIn: parent
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                duration: 1000
                running: true
                loops: -1
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: true
    }
}
