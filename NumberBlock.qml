import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    id: rootId
    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.margins: blockMargins

    /* PROPERTIES */
    property color buttonColor: "#00bbf0"
    property color hoverColor: "#6bd3f0"
    property color pressColor: "#0596c0"
    property color backGroundColor: "white"
    property int blockMargins: 0
    property int fontSize: 18
    property color textColor: "white"
    property bool fontBold: true
    property int borderWidth: 0
    property int borderRadius: 3
    property string ansButtonText: "ANS"

    /* SIGNALS */
    signal clearButtonClicked
    signal removeLastButtonClicked
    signal openingBracketButtonClicked
    signal closingBracketButtonClicked
    signal powerOfButtonClicked
    signal divideButtonClicked
    signal multiplicateButtonClicked
    signal minusButtonClicked
    signal plusButtonClicked
    signal commaButtonClicked
    signal resultButtonClicked
    signal zeroButtonClicked
    signal oneButtonClicked
    signal twoButtonClicked
    signal threeButtonClicked
    signal fourButtonClicked
    signal fiveButtonClicked
    signal sixButtonClicked
    signal sevenButtonClicked
    signal eightButtonClicked
    signal nineButtonClicked
    signal ansButtonClicked

    /* FUNCTIONS */
    function setHexadecimalInput()
    {
        nineButtonId.setEnabled(true)
        eightButtonId.setEnabled(true)
        sevenButtonId.setEnabled(true)
        sixButtonId.setEnabled(true)
        fiveButtonId.setEnabled(true)
        fourButtonId.setEnabled(true)
        threeButtonId.setEnabled(true)
        twoButtonId.setEnabled(true)
        commaButtonId.setEnabled(false)
    }
    function setDecimalInput()
    {
        nineButtonId.setEnabled(true)
        eightButtonId.setEnabled(true)
        sevenButtonId.setEnabled(true)
        sixButtonId.setEnabled(true)
        fiveButtonId.setEnabled(true)
        fourButtonId.setEnabled(true)
        threeButtonId.setEnabled(true)
        twoButtonId.setEnabled(true)
        commaButtonId.setEnabled(true)
    }
    function setOctalInput()
    {
        nineButtonId.setEnabled(false)
        eightButtonId.setEnabled(false)
        sevenButtonId.setEnabled(true)
        sixButtonId.setEnabled(true)
        fiveButtonId.setEnabled(true)
        fourButtonId.setEnabled(true)
        threeButtonId.setEnabled(true)
        twoButtonId.setEnabled(true)
        commaButtonId.setEnabled(false)
    }

    function setBinaryInput()
    {
        nineButtonId.setEnabled(false)
        eightButtonId.setEnabled(false)
        sevenButtonId.setEnabled(false)
        sixButtonId.setEnabled(false)
        fiveButtonId.setEnabled(false)
        fourButtonId.setEnabled(false)
        threeButtonId.setEnabled(false)
        twoButtonId.setEnabled(false)
        commaButtonId.setEnabled(false)
    }

    Rectangle{
        anchors.fill: parent
        color: backGroundColor

        GridLayout{
            id: gridLayout
            anchors.fill: parent
            columns: 4
            Layout.margins: 10

            MButton{
                id: clearButtonId
                text: "Clear"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.columnSpan: 2
                onClicked: {
                    rootId.clearButtonClicked()
                }
            }
            MButton{
                id: removeLastButtonId
                text: "<-"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.columnSpan: 2
                onClicked: {
                    rootId.removeLastButtonClicked()
                }
            }
            MButton{
                id: openingBracketButtonId
                text: "("
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.openingBracketButtonClicked()
                }
            }
            MButton{
                id: closingBracketButtonId
                text: ")"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.closingBracketButtonClicked()
                }
            }
            MButton{
                id: powerOfButtonId
                text: "^"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.powerOfButtonClicked()
                }
            }
            MButton{
                id: divideButtonId
                text: "/"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.divideButtonClicked()
                }
            }
            MButton{
                id: sevenButtonId
                text: "7"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.sevenButtonClicked()
                }
            }
            MButton{
                id: eightButtonId
                text: "8"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.eightButtonClicked()
                }
            }
            MButton{
                id: nineButtonId
                text: "9"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.nineButtonClicked()
                }
            }
            MButton{
                id: multiplicateButtonId
                text: "*"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.multiplicateButtonClicked()
                }
            }
            MButton{
                id: fourButtonId
                text: "4"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.fourButtonClicked()
                }
            }
            MButton{
                id: fiveButtonId
                text: "5"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.fiveButtonClicked()
                }
            }
            MButton{
                id: sixButtonId
                text: "6"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.sixButtonClicked()
                }
            }
            MButton{
                id: minusButtonId
                text: "-"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.minusButtonClicked()
                }
            }
            MButton{
                id: oneButtonId
                text: "1"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.oneButtonClicked()
                }
            }
            MButton{
                id: twoButtonId
                text: "2"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.twoButtonClicked()
                }
            }
            MButton{
                id: threeButtonId
                text: "3"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.threeButtonClicked()
                }
            }
            MButton{
                id: plusButtonId
                text: "+"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.plusButtonClicked()
                }
            }
            MButton{
                id: ansButtonId
                text: ansButtonText
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.ansButtonClicked()
                }
            }
            MButton{
                id: zeroButtonId
                text: "0"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.zeroButtonClicked()
                }
            }
            MButton{
                id: commaButtonId
                text: ","
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.commaButtonClicked()
                }
            }
            MButton{
                id: resultButtonId
                text: "="
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.resultButtonClicked()
                }
            }
        }
    }
}
