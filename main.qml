import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 450
    height: 680
    visible: true
    title: qsTr("Hello World")

    property string equ: ""
    property int resultNum: 0
    property int fNumber: 0
    property int sNumber: 0

    function checkButton(btn){
        if(!isNaN(btn))
            digit_pressed(btn);
        else if (btn === ".")
            decimal_pressed();
        else if(btn === "AC")
            result.text = 0
        else if(btn === "<-")
            result.text = result.text.slice(0, -1)


        console.log(btn)
    }
    function digit_pressed(num){
        console.log(num)
        var butVal = num;
        var displayVal = result.text;
        if((Number.parseFloat(displayVal) === 0) && (!displayVal.includes("."))){
            result.text = butVal;

        }else{
            var newVal = displayVal + butVal;
//            var doubleVal = Number.parseFloat(newVal)
            result.text = newVal;

        }
    }
    function decimal_pressed(){
        var displayVal = result.text;
        displayVal = (displayVal.includes("."))? displayVal : displayVal + ".";
        result.text = displayVal;
    }

    Item{
        id: resultBox

        height: parent.height/4
        width: parent.width

        Label{
            id: equation
            text: ''
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
                    onClicked: {
                        checkButton(text);

                    }
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
