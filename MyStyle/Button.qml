import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T
import Qt5Compat.GraphicalEffects

T.Button {
    id: root

    highlighted: true
    flat: true
    hoverEnabled: true;
    background: Item {
        anchors.fill: parent
        DropShadow {
            anchors.fill: backgroundFill
            horizontalOffset: 0
            verticalOffset: 0
            spread: 0.2
            radius: 1
            color: "#aa000000"
            transparentBorder: true

            source: backgroundFill
        }
        Rectangle {
            id: backgroundFill
            anchors.fill: parent
            radius: 10
            color: "#fff"

        }
    }

    contentItem: Item {
        anchors.fill: parent
        Label {
            anchors.centerIn: parent
            color: "gray"
            text: root.text
            font.pixelSize: 18
        }
    }
}
