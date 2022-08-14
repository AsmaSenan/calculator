import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 450
    height: 680
    visible: true
    title: qsTr("Hello World")

    property string equ: ""
    property double firstNumber
    property bool isFirstNumber: true
    property bool divTrigger: false
    property bool multTrigger: false
    property bool addTrigger: false
    property bool subTrigger: false



    function checkButton(btn){
        if(!isNaN(btn))
            digit_pressed(btn);
        else if (btn === ".")
            decimal_pressed();
        else if(btn === "AC")
            result.text = 0

        else if(btn === "<-")
            result.text = result.text.slice(0, -1)
        else
            operation_pressed(btn);

        equation.text += btn
    }
    function digit_pressed(num){
        var butVal = num;
        var displayVal = result.text;
        if(((Number.parseFloat(displayVal) === 0) || (displayVal === "")) && (!displayVal.includes(".")))
            result.text = butVal;

        else{
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

    function operation_pressed(btn){

        if (isFirstNumber){
            divTrigger = false;
            multTrigger = false;
            addTrigger = false;
            subTrigger = false;

            firstNumber = Number.parseFloat(result.text)
            isFirstNumber = false
            if(btn === "÷")
                divTrigger = true;
            else if(btn === "x")
                multTrigger = true;
            else if(btn === "+")
                addTrigger = true;
            else
                subTrigger = true;


            console.log("first Number => " + firstNumber)
            console.log("adding => " + addTrigger)
            result.text = "";
            altResult.text = firstNumber;

        }else if(addTrigger || subTrigger || multTrigger || divTrigger ){
            var solution = 0.0
            var dblDisplayVal = Number.parseFloat(result.text);

            if(addTrigger){
                solution = firstNumber + dblDisplayVal;
            } else if(subTrigger){
                solution = firstNumber - dblDisplayVal;
            } else if(multTrigger){
                solution = firstNumber * dblDisplayVal;
            } else {
                solution = firstNumber / dblDisplayVal;
            }
            console.log("--------------------------------------")

            console.log("first Number => " + firstNumber)
            console.log("solution => " + solution)
            console.log("=============================")

            result.text = "";
            altResult.text = solution;
            isFirstNumber = true
        }





    }

    function performOperation(){




        // Put solution in display





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
        Label{
            id: altResult
            text: '0'
            visible: result.text === ''? true : false;
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
