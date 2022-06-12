import QtQuick 2.15
import QtQuick3D 1.15
import QtQuick3D.Materials 1.15
import Quick3DAssets.Toaster 1.0
import Onlygui5 1.0

Node {
    id: rootNode
    state: stateName
    Model {
        id: toast
        eulerRotation.x: -90
        scale.x: 100
        scale.y: 100
        scale.z: 100
        source: "meshes/bread_Slice.mesh"

        materials: [
            m_toast_material
        ]
        PrincipledMaterial {
            id: m_toast_material
            normalStrength: 1
            normalMap: m_toast_normal
            baseColor: "#ffffff"
            baseColorMap:   (Values.bakeProcentValues<=30)? m_toast_albedo :(Values.bakeProcentValues<=60)? m_toast_albedoMid : m_toast_albedoSpalony
            metalness: 0.9


            Texture {
                id: m_toast_albedo
                source: "maps/M_Toast_albedo.jpg"
            }
            Texture {
                id: m_toast_albedoSpalony
                source: "maps/spalonyM_Toast_albedo.jpg"
            }
            Texture {
                id: m_toast_albedoMid
                source: "maps/midM_Toast_albedo.jpg"
            }


            Texture {
                id: m_toast_normal
                source: "maps/M_Toast_normal.png"
            }
        }
    }
    Model {
        id: toaster
        eulerRotation.x: -90
        scale.x: 100
        scale.y: 100
        scale.z: 100
        source: "meshes/toaster.mesh"

        materials: [
            m_toaster_material
        ]
//        materials: [ PrincipledMaterial {

//                baseColorMap: Texture { source: "maps/toaster_M_toaster_BaseColor.jpg" }
//                metalnessMap: Texture { source: "maps/M_toaster_metallic.jpg" }
//                roughnessMap: Texture { source: "maps/M_toaster_roughness.jpgpg" }
//                normalMap: Texture { source: "maps/M_toaster_normal.png" }

//                metalnessChannel: Material.R
//                roughnessChannel: Material.R
//            }
//        ]
        PrincipledMaterial {
            id: m_toaster_material
            normalStrength: 1
            normalMap: m_toaster_normal
            occlusionChannel: Material.G
            occlusionAmount: 0.7
            roughness: 1
            roughnessChannel: Material.R
            occlusionMap: m_toaster_RGB
            baseColor: "#ffffff"
            roughnessMap: m_toaster_roughness
            metalnessChannel: Material.R
            metalnessMap: m_toaster_metallic
            baseColorMap: m_toaster_albedo
            metalness: 0.9

            Texture {
                id: m_toaster_hdri
                source: "maps/hdri.jpg"
            }
            Texture {
                id: m_toaster_albedo
                source: "maps/toaster_M_toaster_BaseColor.jpg"
            }

            Texture {
                id: m_toaster_normal
                source: "maps/M_toaster_normal.png"
            }
            Texture {
                id: m_toaster_RGB
                source: "maps/toaster_M_toaster_OcclusionRoughnessMetallic.jpg"
            }

            Texture {
                id: m_toaster_roughness
                source: "maps/M_toaster_roughness.jpg"
            }
            Texture {
                id: m_toaster_opacity
                source: "maps/M_toaster_opacity.jpg"
            }
            Texture {
                id: m_toaster_metallic
                source: "maps/M_toaster_metallic.jpg"
            }
        }
    }

    Model {
        id: metalSideR
        eulerRotation.x: -90
        scale.x: 100
        scale.y: 100
        scale.z: 100
        source: "meshes/metalSideR.mesh"
        materials: [
            m_toaster_material
        ]
    }

    Model {
        id: metalInside
        eulerRotation.x: -90
        scale.x: 100
        scale.y: 100
        scale.z: 100
        source: "meshes/metalInside.mesh"
        materials: [
            m_toaster_material
        ]
    }

    Model {
        id: mainTriger
        x: 0
        y: 18.772
        eulerRotation.x: -90
        scale.x: 100
        scale.y: 100
        scale.z: 100
        source: "meshes/mainTriger.mesh"
        z: -0
        materials: [
            m_toaster_material
        ]
    }

    Model {
        id: button
        eulerRotation.x: -90
        scale.x: 100
        scale.y: 100
        scale.z: 100
        source: "meshes/button.mesh"
        materials: [
            m_toaster_material
        ]
    }

    Model {
        id: metalSideL
        eulerRotation.x: -90
        scale.x: 100
        scale.y: 100
        scale.z: 100
        source: "meshes/metalSideL.mesh"
        materials: [
            m_toaster_material
        ]
    }

    Model {
        id: glass
        x: 13.695
        y: -0
        eulerRotation.x: -89.98022
        eulerRotation.y: -1.78991
        source: "meshes/glass.mesh"
        eulerRotation.z: -1.78991
        z: 4.1852
        scale.z: 100
        scale.y: 100
        scale.x: 100
        materials: [
            m_toaster_glass
        ]

        PrincipledMaterial {
            id: m_toaster_glass
            opacity: 1
            roughnessChannel: Material.R
            normalStrength: 1
            occlusionAmount: 0.9
            normalMap: m_toaster_normal
            opacityChannel: Material.R
            alphaMode: PrincipledMaterial.Blend
            opacityMap: m_toaster_opacity
            occlusionChannel: Material.G
            occlusionMap: m_toaster_RGB
            roughnessMap: m_toaster_roughness
            metalnessChannel: Material.R
            metalnessMap: m_toaster_metallic
            baseColorMap: m_toaster_albedo
            roughness: 1
            metalness: 1
        }
    }

    SpotLight {
        id: lightSpot
        x: -37.584
        y: 305.97
        eulerRotation.z: 0
        eulerRotation.y: -0
        eulerRotation.x: -32.70129
        brightness: 2074
        z: 336.85153
    }

    states: [
            State {
                name: "FrontState"


            },
            State {
                name: "BackState"



            },
            State {
                name: "LogoState"



            },
            State {
            name: "TopState"


        },
        State {
            name: "ContactState"


        },
        State {
            name: "OnState"

                PropertyChanges {
                    target: mainTriger
                    x: -0
                    y: -60.559
                    z: 13.67287
                }

                PropertyChanges {
                    target: metalSideL
                    x: 6.85
                    y: 0
                    z: 0
                }

                PropertyChanges {
                    target: metalSideR
                    x: -8.433
                    y: 0
                    z: 0
                }

                PropertyChanges {
                    target: toast
                    x: -0
                    y: -118.92
                    z: -0.00001
                }

                PropertyChanges {
                    target: m_toaster_glass
                    alphaMode: PrincipledMaterial.Blend
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
                    target: mainTriger
                    easing.bezierCurve: [0.2,0.2,0.8,0.8,1,1]
                    properties: "x,y,z,eulerRotation.z,eulerRotation.y,eulerRotation.x"
                    duration: transitionTime*2
                }
                PropertyAnimation {
                    //id: propertyAnimation
                    target: metalSideL
                    easing.bezierCurve: [0.2,0.2,0.8,0.8,1,1]
                    properties: "x,y,z"
                    duration: transitionTime*2
                }
                PropertyAnimation {
                    //id: propertyAnimation
                    target: metalSideR
                    easing.bezierCurve: [0.2,0.2,0.8,0.8,1,1]
                    properties: "x,y,z"
                    duration: transitionTime*2
                }
                PropertyAnimation {
                    //id: propertyAnimation
                    target: toast
                    easing.bezierCurve: [0.2,0.2,0.8,0.8,1,1]
                    properties: "x,y,z"
                    duration: transitionTime*2
                }
            }
        ]
}
