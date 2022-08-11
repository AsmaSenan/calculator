import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 450
    height: 680
    visible: true
    title: qsTr("Hello World")

    Label{
        id: result
        height: parent.height/4
        width: parent.width
        text: '0'
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        rightPadding: 15
        font.pixelSize: 40
        elide: Text.ElideRight

    }
    GridLayout{
        height: parent.height - result.height
        width: parent.width
        anchors.top: result.bottom
        columns: 4
        Repeater {
            model: ["AC", "<-", "%", "÷", 7,8,9,"x",4,5,6,"-",1,2,3,"+",0,".", "="]
            Button {
                Layout.fillWidth:true
                Layout.fillHeight:true
                text: modelData
            }
        }
    }
}
