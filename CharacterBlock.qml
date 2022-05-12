import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    id: rootId
    Layout.fillHeight: true

    /* PROPERTIES */
    property color buttonColor: "#00bbf0"
    property color hoverColor: "#6bd3f0"
    property color pressColor: "#0596c0"
    property int fontSize: 18
    property color textColor: "white"
    property bool fontBold: true
    property int borderWidth: 0
    property int borderRadius: 3

    /* SIGNALS */
    signal aButtonClicked
    signal bButtonClicked
    signal cButtonClicked
    signal dButtonClicked
    signal eButtonClicked
    signal fButtonClicked

    function setEnabled(state){
        aButtonId.enabled = state
        aButtonId.hoverEnabled = state
        bButtonId.enabled = state
        bButtonId.hoverEnabled = state
        cButtonId.enabled = state
        cButtonId.hoverEnabled = state
        dButtonId.enabled = state
        dButtonId.hoverEnabled = state
        eButtonId.enabled = state
        eButtonId.hoverEnabled = state
        fButtonId.enabled = state
        fButtonId.hoverEnabled = state
    }

    Rectangle{
        anchors.fill: parent

        ColumnLayout{
            anchors.fill: parent
            Layout.margins: 10

            MButton{
                id: aButtonId
                text: "A"
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
                    rootId.aButtonClicked()
                }
            }
            MButton{
                id: bButtonId
                text: "B"
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
                    rootId.bButtonClicked()
                }
            }
            MButton{
                id: cButtonId
                text: "C"
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
                    rootId.cButtonClicked()
                }
            }
            MButton{
                id: dButtonId
                text: "D"
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
                    rootId.dButtonClicked()
                }
            }
            MButton{
                id: eButtonId
                text: "E"
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
                    rootId.eButtonClicked()
                }
            }
            MButton{
                id: fButtonId
                text: "F"
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
                    rootId.fButtonClicked()
                }
            }
        }
    }
}
