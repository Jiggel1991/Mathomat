import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    id: rootId
    width: 100
    height: parent.height

    /* PROPERTIES */
//    property color buttonColor: "#00bbf0"
    property color buttonColor: "white"
    property color hoverColor: "#aaaaaa"
    property color pressColor: "slategray"
    property int fontSize: 20
    property color textColor: "black"
    property bool fontBold: false
    property int borderWidth: 0
    property int borderRadius: 0

    /* SIGNALS */
    signal standardButtonClicked
    signal scientificButtonClicked
    signal programmerButtonClicked
    signal functionsButtonClicked

    function open(){
        drawerId.open()
    }
    function close(){
        drawerId.close()
    }

    Drawer{
        id: drawerId
        width: rootId.width
        height: rootId.height
        interactive: true

        ColumnLayout{
            width: parent.width
            spacing: 0
            MButton{
                text: "Standard"
                Layout.fillWidth: true
                height: drawerId.height / 8
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                scaleFactor: 1.0
                onClicked: {
                    standardButtonClicked()
                }
            }
            Rectangle{
                Layout.fillWidth: true
                height: 2
                border.width: 1
                border.color: "grey"
            }
            MButton{
                text: "Wissenschaftlich"
                Layout.fillWidth: true
                height: drawerId.height / 8
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                scaleFactor: 1.0
                onClicked: {
                    scientificButtonClicked()
                }
            }
            Rectangle{
                Layout.fillWidth: true
                height: 2
                border.width: 1
                border.color: "grey"
            }
            MButton{
                text: "Programmierer"
                Layout.fillWidth: true
                height: drawerId.height /8
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                scaleFactor: 1.0
                onClicked: {
                    programmerButtonClicked()
                }
            }
            Rectangle{
                Layout.fillWidth: true
                height: 2
                border.width: 1
                border.color: "grey"
            }
            MButton{
                text: "Funktionen"
                Layout.fillWidth: true
                height: drawerId.height /8
                fontSize: rootId.fontSize
                fontBold: rootId.fontBold
                textColor: rootId.textColor
                color: rootId.buttonColor
                hoverColor: rootId.hoverColor
                pressColor: rootId.pressColor
                borderRadius: rootId.borderRadius
                borderWidth: rootId.borderWidth
                scaleFactor: 1.0
                onClicked: {
                    functionsButtonClicked()
                }
            }
            Rectangle{
                Layout.fillWidth: true
                height: 2
                border.width: 1
                border.color: "grey"
            }
        }
    }
}
