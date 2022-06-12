import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick3D 1.15
//import QtQuick.Studio.Components 1.0
import QtQuick3D.Effects 1.15
//import QtQuick.Studio.Effects 1.0
import QtQuick.Timeline 1.0
import Quick3DAssets.Cube 1.0
import Quick3DAssets.Toaster 1.0

View3D {
    id: view3D
    anchors.fill: parent
    state: stateName

    environment: sceneEnvironment

    SceneEnvironment {
        id: sceneEnvironment

        antialiasingMode: SceneEnvironment.MSAA
        antialiasingQuality: SceneEnvironment.High
        clearColor: "#1f222d"
        //            Texture {
        //                id: hdri
        //                source: "images/hdri.jpg"
        //            }
    }

    Node {
        id: scene

        DirectionalLight {
            id: directionalLight
            x: 34.45
            y: 324.352
            eulerRotation.z: -5.05605
            eulerRotation.y: -13.87233
            eulerRotation.x: -21.66139
            brightness: 418
            z: 427.54962
        }
        PerspectiveCamera {
            id: sceneCamera
            x: 192.681
            y: 173.607
            eulerRotation.z: -2.91337
            eulerRotation.y: 35.57582
            eulerRotation.x: -4.07994
            z: 380.5567
        }

        DirectionalLight {
            id: lightDirectional
            x: 305.31
            y: 317.284
            brightness: 399
            eulerRotation.z: -46.47783
            eulerRotation.y: 134.65977
            eulerRotation.x: -8.65028
            z: -86.86814
        }
    }

    Toaster {
        id: toaster
        scale.x: 1
        eulerRotation.z: -0.00001
        eulerRotation.y: 41.88859
        eulerRotation.x: 0
    }


    states: [
            State {
                name: "FrontState"

                PropertyChanges {
                    target: sceneCamera
                    x: 192.681
                    y: 172.276
                    eulerRotation.z: -2.91337
                    eulerRotation.y: 35.57582
                    eulerRotation.x: -4.07994
                    z: 380.67346

                }


            },
            State {
                name: "BackState"

                PropertyChanges {
                    target: sceneCamera
                    x: -511.443
                    y: 144.433
                    eulerRotation.z: 4.89597
                    eulerRotation.y: -77.66684
                    eulerRotation.x: -1.07313
                    z: -16.72456
                }



            },
            State {
                name: "LogoState"

                PropertyChanges {
                    target: sceneCamera
                    x: 374.713
                    y: 283.972
                    eulerRotation.z: -1.44687
                    eulerRotation.y: 88.92342
                    eulerRotation.x: -18.99145
                    z: 133.7863

                }


            },
            State {
                name: "TopState"
                PropertyChanges {
                    target: sceneCamera
                    x: 119.968
                    y: 461.962
                    eulerRotation.z: -4.21152
                    eulerRotation.y: 38.41797
                    eulerRotation.x: -46.34355
                    z: 280.57666

                }


            },
            State {
                name: "ContactState"

                PropertyChanges {
                    target: sceneCamera
                    x: -106.256
                    y: 334.165
                    eulerRotation.z: 6.0445
                    eulerRotation.y: -18.97618
                    eulerRotation.x: -20.08074
                    z: 156.12225
                }

                PropertyChanges {
                    target: timeline
                    enabled: false
                }

                PropertyChanges {
                    target: timelineAnimation
                    running: false
                }

            },
            State {
                name: "OnState"

                PropertyChanges {
                    target: sceneCamera
                    x: -8.507
                    y: 417.364
                    eulerRotation.z: -7.0748
                    eulerRotation.y: 7.80802
                    eulerRotation.x: -42.44286
                    z: 312.15302

                }

                PropertyChanges {
                    target: timeline
                    enabled: true
                }

                PropertyChanges {
                    target: timelineAnimation
                    running: true
                }

            }
        ]

        transitions: [
            Transition {
                //id: transitionCamera
                from: "*"
                to: "*"

                PropertyAnimation {
                    //id: propertyAnimation
                    target: sceneCamera
                    easing.bezierCurve: [0.2,0.2,0.8,0.8,1,1]
                    properties: "x,y,z,eulerRotation.z,eulerRotation.y,eulerRotation.x"
                    duration: transitionTime*2
                }
            }
        ]
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:4}
}
##^##*/
