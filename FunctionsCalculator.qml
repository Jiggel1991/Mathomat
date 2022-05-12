import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12

Item {
    id: rootId

    /* PROPERTIES */
    property color functionsBlockColor: "#ededed"
    /** FUNCTIONS **/

    RowLayout
    {
        id: mainLayoutId
        anchors.fill: parent
        Rectangle
        {
            id: functionsBlockRectId
            implicitWidth: rootId.width * 0.2
            Layout.fillHeight: true
            color: functionsBlockColor
            ColumnLayout
            {
                anchors.fill: parent
                FunctionsBlock
                {
                    id: functionsBlockId
                    backGroundColor: functionsBlockColor
                    blockMargins: 5
                }
                NumberBlock
                {
                    id: numberBlockId
                    backGroundColor: functionsBlockColor
                    blockMargins: 5
                    ansButtonText: "x"
                    /* number buttons slots */
                    onClearButtonClicked: functionsBlockId.setFocusedFunctionText("")
                    onRemoveLastButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText().slice(0, functionsBlockId.focusedFunctionText().length - 1))
                    onOpeningBracketButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "(")
                    onClosingBracketButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + ")")
                    onPowerOfButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "^")
                    onDivideButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "/")
                    onMultiplicateButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "*")
                    onMinusButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "-")
                    onPlusButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "+")
                    onCommaButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + ",")
                    onOneButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "1")
                    onTwoButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "2")
                    onThreeButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "3")
                    onFourButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "4")
                    onFiveButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "5")
                    onSixButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "6")
                    onSevenButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "7")
                    onEightButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "8")
                    onNineButtonClicked: functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "9")
                    onZeroButtonClicked: {
                        functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "0")
                        canvasId.drawLine(0, 200, 200, 500)
                    }
                        onAnsButtonClicked:{

                        canvasId.drawGrid()

                        functionsBlockId.setFocusedFunctionText(functionsBlockId.focusedFunctionText() + "x")
                    }
               }
            }
        }
        DropShadow
        {
            anchors.fill: functionsBlockRectId
            horizontalOffset: 3
            verticalOffset: 0
            radius: 8.0
            samples: 17
            color: "#9e9e9e"
            source: functionsBlockRectId
        }
        Rectangle
        {
            id: canvasRectangleId
            implicitWidth: rootId.width * 0.8
            Layout.fillHeight: true
            MCanvas
            {
                id: canvasId
                anchors.fill: parent
            }
        }
    }
}
