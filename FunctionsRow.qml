import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item
{
    id: rootId

    /** PROPERTIES **/
    property color p_borderColor: "#b8b8b8"

    /** FUNCTIONS **/
    function setText(_string)
    {
        functionLabelId.text = _string;
    }
    function text()
    {
        return functionLabelId.text;
    }

    Rectangle
    {
        id: functionRowRectanglelId
        anchors.fill: parent
        border.width: 1
        border.color: p_borderColor
        Grid
        {
            id: functionRowGridId
            columns: 4
            /** ACTIVATE / DEACTIVATE BUTTON **/
            MButton
            {
                id: activeButtonId
                width: rootId.height
                height: rootId.height
                color: "green"
                borderRadius: 100
                borderWidth: 0
                p_anchorsMargins: 7
            }
            /** SEPERATOR **/
            Rectangle
            {
                width: 1
                height: rootId.height
                color: p_borderColor
            }
            /** LABEL **/
            Rectangle
            {
                id: labelFrameId
                height: rootId.height
                width: functionRowRectanglelId.width - (activeButtonId.width + settingsButtonId.width)
                radius: 0
                color: "transparent"
                Label
                {
                    id: functionLabelId
                    anchors.centerIn: parent
                    font.bold: true
                }
            }
            /** SETTINGSBUTTON **/
            Rectangle
            {
                id: settingsButtonId
                width: 20
                height: rootId.height
                color: "transparent"
                        Rectangle
                        {
                            id: topRectId
                            color: "#858585"
                            width: 4
                            height: 4
                            radius: 100
                            anchors.bottom: midRectId.top
                            anchors.bottomMargin: 2
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Rectangle
                        {
                            id: midRectId
                            color: "#858585"
                            width: 4
                            height: 4
                            radius: 100
                            anchors.centerIn: parent
                        }
                        Rectangle
                        {
                            id: bottomRectId
                            color: "#858585"
                            width: 4
                            height: 4
                            radius: 100
                            anchors.top: midRectId.bottom
                            anchors.topMargin: 2
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        MouseArea
                        {
                            id: mouseAreaId
                            width: topRectId.width + 5
                            height: topRectId.height * 3 + topRectId.anchors.bottomMargin * 2 + 5
                            anchors.centerIn: parent
                            hoverEnabled: true
                            onEntered:
                            {
                                topRectId.color = "black"
                                midRectId.color = "black"
                                bottomRectId.color = "black"
                            }
                            onExited:
                            {
                                topRectId.color = "#858585"
                                midRectId.color = "#858585"
                                bottomRectId.color = "#858585"
                            }
                            onClicked:
                            {

                            }
                        }
            }
        }
    }
}
