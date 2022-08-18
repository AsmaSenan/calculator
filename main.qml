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
    property int count: 0
    property string solution: ""
    property bool isNewNumber: false
    property bool divTrigger: false
    property bool multTrigger: false
    property bool addTrigger: false
    property bool subTrigger: false



    function checkButton(btn){

        if(!isNaN(btn))
            digit_pressed(btn);
        else if (btn === ".")
            decimal_pressed();
        else if(btn === "AC"){
            result.text = 0
            equation.text = ""
            solution = 0
            firstNumber = 0
            isNewNumber = false
            divTrigger = false
            multTrigger = false
            addTrigger = false
            subTrigger = false
            equ = ""
            count = 0
            btn = ""
        }else if(btn === "<-"){
            result.text = result.text.slice(0, -1)
            equation.text = equation.text.slice(0, -1)
            btn = ""
        }else
            operation_pressed(btn);

        equation.text += btn
    }

    function digit_pressed(num){
        // Get number on button
        var butVal = num;

        // Get the value in the display
        var displayVal = result.text;
        if(((Number.parseFloat(displayVal) === 0) || (displayVal === "")) && (!displayVal.includes(".")))
            result.text = butVal;
        else{
            var newVal = displayVal + butVal;
            result.text = Number.parseFloat(newVal);
        }
    }
    function decimal_pressed(){
        var displayVal = result.text;
        displayVal = (displayVal.includes("."))? displayVal : displayVal + ".";
        result.text = displayVal;
    }

    function operation_pressed(btn){

        // Cancel out previous math button clicks
        count+=1

        if(count != 1){
            performOperation()
            console.log("=============================")
            console.log("call perform")
            console.log("=============================")


        }

            divTrigger = false;
            multTrigger = false;
            addTrigger = false;
            subTrigger = false;

            // Store current value in Display
            firstNumber = Number.parseFloat(result.text)
            console.log("first Number => " + firstNumber)
            console.log("|||||||||||||||||||||||||||||||||")

            if(btn === "÷")
                divTrigger = true;
            else if(btn === "x")
                multTrigger = true;
            else if(btn === "+")
                addTrigger = true;
            else
                subTrigger = true;





            result.text = "";

    }

    function performOperation(){

        var dblDisplayVal = Number.parseFloat(result.text);

        if(addTrigger || subTrigger || multTrigger || divTrigger ){


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

            result.text = solution;
                        altResult.text = solution;
            isNewNumber = true
        }


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
            text: ""
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
                onClicked: performOperation();
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
