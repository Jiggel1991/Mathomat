import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    id: rootId
    Layout.fillWidth: true
    Layout.fillHeight: true

    /* PROPERTIES */
    property color buttonColor: "#42b883"
    property color hoverColor: "#5fcf9d"
    property color pressColor: "#349167"
    property int fontSize: 14
    property color textColor: "white"
    property bool fontBold: true
    property int borderWidth: 0
    property int borderRadius: 3

    /* FUNCTIONS */
    function setDegButtonActivated(state){
        if(state){
            degButtonId.color = rootId.pressColor
            degButtonId.hoverColor = rootId.pressColor
            radButtonId.color = rootId.buttonColor
            radButtonId.hoverColor = rootId.hoverColor
        }
        else{
            degButtonId.color = rootId.buttonColor
            degButtonId.hoverColor = rootId.hoverColor
            radButtonId.color = rootId.pressColor
            radButtonId.hoverColor = rootId.pressColor
        }
    }

    /* SIGNALS */
    signal degButtonClicked
    signal radButtonClicked
    signal modButtonClicked
    signal sinButtonClicked
    signal cosButtonClicked
    signal tanButtonClicked
    signal arcsinButtonClicked
    signal arccosButtonClicked
    signal arctanButtonClicked
    signal lnButtonClicked
    signal logButtonClicked
    signal ldButtonClicked
    signal piButtonClicked
    signal eButtonClicked
    signal nCrButtonClicked
    signal factButtonClicked
    signal squareRootButtonClicked
    signal amountButtonClicked

    Rectangle{
        anchors.fill: parent
        //        color: "yellow"

        GridLayout{
            id: mainGridLayout
            anchors.fill: parent
            columns: 3
            Layout.margins: 10

            MButton{
                id: degButtonId
                text: "Deg"
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.pressColor
                hoverColor: rootId.pressColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    rootId.degButtonClicked()
                }
            }
            MButton{
                id: radButtonId
                text: "Rad"
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
                    rootId.radButtonClicked()
                }
            }
            MButton{
                text: "Mod"
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
                    rootId.modButtonClicked()
                }
            }
            MButton{
                text: "sin"
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
                    rootId.sinButtonClicked()
                }
            }
            MButton{
                text: "cos"
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
                    cosButtonClicked()
                }
            }
            MButton{
                text: "tan"
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
                    rootId.tanButtonClicked()
                }
            }
            MButton{
                text: "arcsin"
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
                    rootId.arcsinButtonClicked()
                }
            }
            MButton{
                text: "arccos"
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
                    rootId.arccosButtonClicked()
                }
            }
            MButton{
                text: "arctan"
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
                    rootId.arctanButtonClicked()
                }
            }
            MButton{
                text: "ln"
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
                    rootId.lnButtonClicked()
                }
            }
            MButton{
                text: "log"
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
                    rootId.logButtonClicked()
                }
            }
            MButton{
                text: "ld"
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
                    rootId.ldButtonClicked()
                }
            }
            MButton{
                text: math.getPiSymbol();
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
                    rootId.piButtonClicked()
                }
            }
            MButton{
                text: "e"
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
                text: "nCr"
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
                    rootId.nCrButtonClicked()
                }
            }
            MButton{
                text: "!"
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
                    rootId.factButtonClicked()
                }
            }
            MButton{
                text: math.getSquareRootSymbol();
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
                    rootId.squareRootButtonClicked()
                }
            }
            MButton{
                text: "|"
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
                    rootId.amountButtonClicked()
                }
            }
        }
    }
}
