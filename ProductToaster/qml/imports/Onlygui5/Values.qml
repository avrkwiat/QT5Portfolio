pragma Singleton
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick3D 1.15
import Quick3DAssets.Toaster 1.0
import pl.nstrefa.avrkwiat 1.0

QtObject {
    id:valueToJs
    /*******menu property*********/
    property bool front: false
    property bool back: false
    property bool logo: false
    property bool top: false
    property bool contact: false
    property bool on: false

    property string stateValues: ValueC.state
    property int bakeProcentValues: ValueC.bakeProcent

}






