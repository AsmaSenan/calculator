import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 450
    height: 680
    visible: true
    title: qsTr("Hello World")
    Item{
        id: resultBox

        height: parent.height/4
        width: parent.width

        Label{
            id: equation
            text: '2*29+47+44'
            anchors.right: parent.right
            rightPadding: 15
            topPadding: 30
            font.pixelSize: 20
            color: "gray"
            elide: Text.ElideRight
        }
        Label{
            id: result
            text: '0'
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            rightPadding: 15
            topPadding: equation.height
            font.pixelSize: 40
            elide: Text.ElideRight

        }

    }
    Item{
        height: parent.height - resultBox.height
        width: parent.width
        anchors.top: resultBox.bottom


        GridLayout{
            id: numberBox
            height: parent.height - 50
            width: parent.width - 30
            anchors.centerIn: parent
            rows: 5
            columns: 4
            columnSpacing: 15
            rowSpacing: 15
            Repeater {
                model: ["AC", "<-", "%", "÷", 7,8,9,"x",4,5,6,"-",1,2,3,"+",0,"."]
                Button {
                    Layout.fillWidth:true
                    Layout.fillHeight:true
                    text: modelData
                }
            }

            Button {
                Layout.fillWidth:true
                Layout.fillHeight:true
                text: "="
                font.pixelSize: 18
                Layout.columnSpan: 2
                background: Rectangle{
                    anchors.fill: parent
                    color: "dark orange"
                    radius: 10
                }
                contentItem: Item{
                    anchors.fill: parent
                    Label{
                        anchors.centerIn: parent
                        color: "#fff"
                        text: "="
                        font.pixelSize: 24

                    }
                }
            }
        }
    }
}
