import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    id: rootId
    height: 10
    Layout.fillWidth: true
    property string termText: ""
    property string resultText: ""
    property int standardPointSize: 25
    property int programmerPointSize: 20
    property color hoverColor: "#d9dad7"
    property string hexInputText: ""
    property string decInputText: ""
    property string octInputText: ""
    property string binInputText: ""
    property bool hexActive: false
    property bool decActive: false
    property bool octActive: false
    property bool binActive: false

    function setProgrammerMode(){
        termInputId.font.pointSize = programmerPointSize
        resultInputId.font.pointSize = programmerPointSize
        implicitHeight = 200
        resultInputId.visible = false
        hexFieldId.visible = true
        decFieldId.visible = true
        octFieldId.visible = true
        binFieldId.visible = true
        hexButtonMouseAreaId.hoverEnabled = true
        decButtonMouseAreaId.hoverEnabled = true
        octButtonMouseAreaId.hoverEnabled = true
        binButtonMouseAreaId.hoverEnabled = true
        termInputId.topPadding = 0
        resultInputId.topPadding = 0
        hexButtonId.color = "transparent"
        decButtonId.color = "blue"
        octButtonId.color = "transparent"
        binButtonId.color = "transparent"
        decActive = true
    }

    function setStandardMode(){
        termInputId.font.pointSize = standardPointSize
        resultInputId.font.pointSize = standardPointSize
        resultInputId.visible = true
        hexFieldId.visible = false
        decFieldId.visible = false
        octFieldId.visible = false
        binFieldId.visible = false
        hexButtonMouseAreaId.hoverEnabled = false
        decButtonMouseAreaId.hoverEnabled = false
        octButtonMouseAreaId.hoverEnabled = false
        binButtonMouseAreaId.hoverEnabled = false
        termInputId.topPadding = 10
        resultInputId.topPadding = 10
    }

    function reverseString(str){
        var splitString = str.split("")
        var reverseArray = splitString.reverse();
        return reverseArray.join("")
    }

    function formatHex(hex){
        var n = Math.floor(hex.length / 4)

        if(hex.length <= 4)
            return hex

        var formatedHex = ""
        var reverseHex = reverseString(hex)
        for(var i=0; i<n; i++){
            for(var k=0; k<4; k++){
                formatedHex += reverseHex.slice(0, 1)
                reverseHex = reverseHex.slice(1)
            }
            if(reverseHex.length !== 0)
                formatedHex += " "
        }
        formatedHex += reverseHex
        return reverseString(formatedHex)
    }

    function formatOct(oct){
        var n = Math.floor(oct.length / 3)

        if(oct.length <= 3)
            return oct

        var formatedOct = ""
        var reverseOct = reverseString(oct)
        for(var i=0; i<n; i++){
            for(var k=0; k<3; k++){
                formatedOct += reverseOct.slice(0, 1)
                reverseOct = reverseOct.slice(1)
            }
            if(reverseOct.length !== 0)
                formatedOct += " "
        }
        formatedOct += reverseOct
        return reverseString(formatedOct)
    }

    function formatBin(bin){
        if(bin === "0")
            return "0"

        var filledStr = bin
        /* fill the binary string to a multiple of four if necessary */
        var n = 4 - (filledStr.length % 4)
        if(n != 0 && n != 4){
            var reverseStr = reverseString(filledStr)
            for(var i=0; i<n; i++){
                reverseStr += "0"
            }
            filledStr = reverseString(reverseStr)
        }

        return formatHex(filledStr)
    }

    function unformatText(text){
        return text.replace(/ /g, "")
    }

    /* SIGNALS */
    signal hexButtonClicked
    signal decButtonClicked
    signal octButtonClicked
    signal binButtonClicked

    Rectangle{
        anchors.fill: parent
        //        color: "red"
        ColumnLayout{
            anchors.fill: parent
            spacing: 0

            TextInput{
                id: termInputId
                text: rootId.termText
                font.pointSize: standardPointSize
                horizontalAlignment: TextInput.AlignRight
                verticalAlignment: TextInput.AlignVCenter
                Layout.fillWidth: true
                rightPadding: 10
                leftPadding: 10
                topPadding: 10
                bottomPadding: 10
                readOnly: true
            }

            TextInput{
                id: resultInputId
                text: rootId.resultText
                font.pointSize: standardPointSize
                horizontalAlignment: TextInput.AlignRight
                verticalAlignment: TextInput.AlignVCenter
                Layout.fillWidth: true
                rightPadding: 10
                leftPadding: 10
                topPadding: 10
                bottomPadding: 10
                readOnly: true
            }
            /******** HEX INPUT ********/
            Rectangle{
                id: hexFieldId
                visible: false
                Layout.fillWidth: true
                height: 30

                states: [
                    State {
                        name: "Hovering"
                        PropertyChanges {
                            target: hexFieldId
                            color: hoverColor
                        }
                    }
                ]

                MouseArea{
                    id: hexButtonMouseAreaId
                    anchors.fill: parent
                    onEntered: { hexFieldId.state='Hovering'}
                    onExited: { hexFieldId.state=''}
                    onClicked: {
                        hexButtonClicked()
                        hexActive = true
                        decActive = false
                        octActive = false
                        binActive = false
                        hexButtonId.color = "blue"
                        decButtonId.color = "transparent"
                        octButtonId.color = "transparent"
                        binButtonId.color = "transparent"
                    }
                }

                RowLayout{
                    id: hexLayoutId
                    anchors.fill: parent
                    spacing: 0

                    Rectangle{
                        id: hexButtonId
                        height: 20
                        width: 10
                        Layout.leftMargin: 10
                        color: "transparent"
                    }
                    Rectangle{
                        id: hexLabelFrameId
                        height: 20
                        width: 30
                        color: "transparent"
                        Label{
                            id: hexLabelId
                            anchors.centerIn: parent
                            text: "Hex"
                            font.bold: true
                        }
                    }
                    Rectangle{
                        id: hexInputFrameId
                        height: 20
                        Layout.fillWidth: true
                        Layout.rightMargin: 10
                        color: "transparent"
                        TextInput{
                            id: hexInputId
                            readOnly: true
                            Layout.fillWidth: true
                            leftPadding: 10
                            font.pointSize: 10
                            text: rootId.hexInputText
                        }
                    }
                }
            }
            /******** DEC INPUT ********/
            Rectangle{
                id: decFieldId
                visible: false
                Layout.fillWidth: true
                height: 30

                states: [
                    State {
                        name: "Hovering"
                        PropertyChanges {
                            target: decFieldId
                            color: hoverColor
                        }
                    }
                ]

                MouseArea{
                    id: decButtonMouseAreaId
                    anchors.fill: parent
                    onEntered: { decFieldId.state='Hovering'}
                    onExited: { decFieldId.state=''}
                    onClicked: {
                        decButtonClicked()
                        hexActive = false
                        decActive = true
                        octActive = false
                        binActive = false
                        hexButtonId.color = "transparent"
                        decButtonId.color = "blue"
                        octButtonId.color = "transparent"
                        binButtonId.color = "transparent"
                    }
                }

                RowLayout{
                    id: decLayoutId
                    anchors.fill: parent
                    spacing: 0
                    Rectangle{
                        id: decButtonId
                        Layout.leftMargin: 10
                        height: 20
                        width: 10
                        color: "blue"
                    }
                    Rectangle{
                        id: decLabelFrameId
                        height: 20
                        width: 30
                        color: "transparent"
                        Label{
                            id: decLabelId
                            anchors.centerIn: parent
                            text: "Dec"
                            font.bold: true
                        }
                    }
                    Rectangle{
                        id: decInputFrameId
                        height: 20
                        Layout.fillWidth: true
                        Layout.rightMargin: 10
                        color: "transparent"

                        TextInput{
                            id: decInputId
                            readOnly: true
                            Layout.fillWidth: true
                            leftPadding: 10
                            font.pointSize: 10
                            text: rootId.decInputText
                        }
                    }
                }
            }
            /******** OCT INPUT ********/
            Rectangle{
                id: octFieldId
                visible: false
                Layout.fillWidth: true
                height: 30

                states: [
                    State {
                        name: "Hovering"
                        PropertyChanges {
                            target: octFieldId
                            color: hoverColor
                        }
                    }
                ]

                MouseArea{
                    id: octButtonMouseAreaId
                    anchors.fill: parent
                    onEntered: { octFieldId.state='Hovering'}
                    onExited: { octFieldId.state=''}
                    onClicked: {
                        octButtonClicked()
                        hexActive = false
                        decActive = false
                        octActive = true
                        binActive = false
                        hexButtonId.color = "transparent"
                        decButtonId.color = "transparent"
                        octButtonId.color = "blue"
                        binButtonId.color = "transparent"
                    }
                }

                RowLayout{
                    id: octLayoutId
                    anchors.fill: parent
                    spacing: 0
                    Rectangle{
                        id: octButtonId
                        height: 20
                        width: 10
                        Layout.leftMargin: 10
                        color: "transparent"
                    }
                    Rectangle{
                        id: octLabelFrameId
                        height: 20
                        width: 30
                        color: "transparent"
                        Label{
                            id: octLabelId
                            anchors.centerIn: parent
                            text: "Oct"
                            font.bold: true
                        }
                    }
                    Rectangle{
                        id: octInputFrameId
                        height: 20
                        Layout.fillWidth: true
                        color: "transparent"
                        Layout.rightMargin: 10
                        TextInput{
                            id: octInputId
                            readOnly: true
                            Layout.fillWidth: true
                            font.pointSize: 10
                            leftPadding: 10
                            text: rootId.octInputText
                        }
                    }
                }
            }
            /******** BIN INPUT ********/
            Rectangle{
                id: binFieldId
                visible: false
                Layout.fillWidth: true
                height: 30

                states: [
                    State {
                        name: "Hovering"
                        PropertyChanges {
                            target: binFieldId
                            color: hoverColor
                        }
                    }
                ]

                MouseArea{
                    id: binButtonMouseAreaId
                    anchors.fill: parent
                    onEntered: { binFieldId.state='Hovering'}
                    onExited: { binFieldId.state=''}
                    onClicked: {
                        binButtonClicked()
                        hexActive = false
                        decActive = false
                        octActive = false
                        binActive = true
                        hexButtonId.color = "transparent"
                        decButtonId.color = "transparent"
                        octButtonId.color = "transparent"
                        binButtonId.color = "blue"
                    }
                }

                RowLayout{
                    id: binLayoutId
                    anchors.fill: parent
                    spacing: 0
                    Rectangle{
                        id: binButtonId
                        height: 20
                        width: 10
                        Layout.leftMargin: 10
                        color: "transparent"
                    }
                    Rectangle{
                        id: binLabelFrameId
                        height: 20
                        width: 30
                        color: "transparent"
                        Label{
                            id: binLabelId
                            anchors.centerIn: parent
                            text: "Bin"
                            font.bold: true
                        }
                    }
                    Rectangle{
                        id: binInputFrameId
                        height: 20
                        Layout.fillWidth: true
                        Layout.rightMargin: 10
                        color: "transparent"

                        TextInput{
                            id: binInputId
                            readOnly: true
                            Layout.fillWidth: true
                            font.pointSize: 10
                            leftPadding: 10
                            text: rootId.binInputText
                        }
                    }
                }
            }
        }
    }
}
