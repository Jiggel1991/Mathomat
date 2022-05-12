import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    id: rootId
    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.margins: blockMargins

    /* PROPERTIES */
    property int blockMargins: 0
    property color backGroundColor: "white"

    /** FUNCTIONS **/
    function setFocusedFunctionText(_string)
    {
        functionRowId.setText(_string);
    }
    function focusedFunctionText()
    {
        return functionRowId.text();
    }

    Rectangle
    {
        id: mainRectangleId
        color: backGroundColor
        anchors.fill: parent
            /** FUNCTIONS LABEL **/
            FunctionsRow
            {
                id: functionRowId
                height: 40
                width: rootId.width * 0.95
                anchors.horizontalCenter: mainRectangleId.horizontalCenter
            }
            /** ADD NEW FUNCTION BUTTON **/
            MButton
            {
                id: newFunctionButtonId
                anchors.top: functionRowId.bottom
                anchors.horizontalCenter: mainRectangleId.horizontalCenter
                text: "+"
                textColor: "grey"
                fontSize: 15
            }
    }
}
