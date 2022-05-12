import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

ApplicationWindow {
    id : rootId
    width: standardWidth
    //    maximumWidth: 600
    //    minimumWidth: 300
    height: 520
    //    maximumHeight: 520
    minimumHeight: 440
    visible: true
    title: qsTr("QML syntax Demo")

    property int standardWidth:     400
    property int standardHeight:    520
    property int scientificWidth:   800
    property int programmerHeight:  600
    property int functionsWidth: 1000
    property int functionsHeight: 1000
    property bool programmerModeActive: false
    property bool hexActive: false
    property bool decActive: false
    property bool octActive: false
    property bool binActive: false
    property bool functionsModeActive: false
    property color headerColor: "white"

    function calculateResult(term){
        if(math.checkSyntax(term)){
            var result = math.calculateTerm(term);
            if(math.isMathError(result))
                displayBlockId.resultText = "Math Error"
            else{
                displayBlockId.resultText = result
                return result
            }
        }
        else
            displayBlockId.resultText = "Syntax Error"
    }
    /************* HEADER *****************/
    header: ToolBar{
        id: headerId
        height: 50
        background: Rectangle{
            color: headerColor
        }
        padding: 10
        RowLayout{
            anchors.fill: parent

            ToolButton{
                id: headerToolButtonId
                background: Rectangle{
                    color: headerColor
                }
                icon.source: "qrc:/images/drawer.png"
                icon.color: "black"
                onClicked: {
                    drawerId.open()
                }

            }
            Label{
                id: titleLabelId
                text: "Standard"
                font.pointSize: 20
                Layout.fillWidth: true
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
            }
        }
    }
    /************* DRAWER *****************/
    MDrawer{
        id: drawerId
        width: rootId.standardWidth * (2/3)
        height: rootId.height

        onStandardButtonClicked: {
            rootId.visibility = "Windowed"
            stackLayoutId.currentIndex = 0
            programmerModeActive = false
            hexActive = false
            octActive = false
            binActive = false
            displayBlockId.visible = true
            scientificBlockId.visible = false
            characterBlockId.visible = false
            numberBlockId.setDecimalInput()
            rootId.width = rootId.standardWidth
            rootId.height = standardHeight
            displayBlockId.setStandardMode()
            displayBlockId.implicitHeight = rootId.height * 0.25
            titleLabelId.text = "Standard"
            drawerId.close()
            console.log(rootId.visibility)
        }
        onScientificButtonClicked: {
            rootId.visibility = "Windowed"
            stackLayoutId.currentIndex = 0
            programmerModeActive = false
            hexActive = false
            octActive = false
            binActive = false
            displayBlockId.visible = true
            scientificBlockId.visible = true
            characterBlockId.visible = false
            numberBlockId.setDecimalInput()
            rootId.width = rootId.scientificWidth
            displayBlockId.setStandardMode()
            displayBlockId.implicitHeight = rootId.height * 0.25
            titleLabelId.text = "Wissenschaftlich"
            drawerId.close()
        }
        onProgrammerButtonClicked: {
            rootId.visibility = "Windowed"
            stackLayoutId.currentIndex = 0
            programmerModeActive = true
            decActive = true
            hexActive = false
            octActive = false
            binActive = false
            displayBlockId.visible = true
            scientificBlockId.visible = false
            characterBlockId.visible = true
            characterBlockId.setEnabled(false)
            rootId.width = rootId.standardWidth
            titleLabelId.text = "Programmierer"
            rootId.height = programmerHeight
            displayBlockId.setProgrammerMode()
            numberBlockId.setDecimalInput()
            drawerId.close()
        }
        onFunctionsButtonClicked: {
            rootId.visibility = "Maximized"
            programmerModeActive = false
            characterBlockId.visible = false
            displayBlockId.visible = false
            stackLayoutId.currentIndex = 1
//            aaa.implicitWidth = Qt.binding(function(){
//                return rootId.width * 0.2
//            })
//            bbb.implicitWidth = Qt.binding(function(){
//                return rootId.width * 0.8
//            })
            titleLabelId.text = "Funktionen"
            headerColor = "#d1d1d1"
            drawerId.close()
        }
    }
    /************* STACKED LAYOUT *****************/
    StackLayout{
        id: stackLayoutId
        anchors.fill: parent
        currentIndex: 0

        /************* FIRST PAGE (CALCULATOR) *****************/
        ColumnLayout{
//            Layout.alignment:
//            anchors.fill: parent

            DisplayBlock{
                id: displayBlockId
                height: rootId.height * 0.25

                onHexButtonClicked: {
                    numberBlockId.setHexadecimalInput()
                    characterBlockId.setEnabled(true)
                    displayBlockId.termText = unformatText(hexInputText)
                    rootId.hexActive = true
                    rootId.decActive = false
                    rootId.octActive = false
                    rootId.binActive = false
                }
                onDecButtonClicked: {
                    numberBlockId.setDecimalInput()
                    characterBlockId.setEnabled(false)
                    displayBlockId.termText = unformatText(decInputText)
                    rootId.hexActive = false
                    rootId.decActive = true
                    rootId.octActive = false
                    rootId.binActive = false
                }
                onOctButtonClicked: {
                    numberBlockId.setOctalInput()
                    characterBlockId.setEnabled(false)
                    displayBlockId.termText = unformatText(octInputText)
                    rootId.hexActive = false
                    rootId.decActive = false
                    rootId.octActive = true
                    rootId.binActive = false
                }
                onBinButtonClicked: {
                    numberBlockId.setBinaryInput()
                    characterBlockId.setEnabled(false)
                    displayBlockId.termText = unformatText(binInputText)
                    rootId.hexActive = false
                    rootId.decActive = false
                    rootId.octActive = false
                    rootId.binActive = true
                }

            }

            RowLayout {
                id : mainLayout
                Layout.margins: 10

                CharacterBlock{
                    id: characterBlockId
                    width: standardWidth / 5
                    visible: false
                    /* character buttons slots */
                    onAButtonClicked: displayBlockId.termText = displayBlockId.termText + "A"
                    onBButtonClicked: displayBlockId.termText = displayBlockId.termText + "B"
                    onCButtonClicked: displayBlockId.termText = displayBlockId.termText + "C"
                    onDButtonClicked: displayBlockId.termText = displayBlockId.termText + "D"
                    onEButtonClicked: displayBlockId.termText = displayBlockId.termText + "E"
                    onFButtonClicked: displayBlockId.termText = displayBlockId.termText + "F"
                }

                NumberBlock{
                    id: numberBlockId
                    /* number buttons slots */
                    onClearButtonClicked: {
                        displayBlockId.termText = ""
                        displayBlockId.resultText = ""
                        if(programmerModeActive){
                            displayBlockId.hexInputText = ""
                            displayBlockId.decInputText = ""
                            displayBlockId.octInputText = ""
                            displayBlockId.binInputText = ""
                        }
                    }
                    onRemoveLastButtonClicked: displayBlockId.termText = displayBlockId.termText.slice(0, displayBlockId.termText.length - 1)
                    onOpeningBracketButtonClicked: displayBlockId.termText = displayBlockId.termText + "("
                    onClosingBracketButtonClicked: displayBlockId.termText = displayBlockId.termText + ")"
                    onPowerOfButtonClicked: displayBlockId.termText = displayBlockId.termText + "^"
                    onDivideButtonClicked: displayBlockId.termText = displayBlockId.termText + "/"
                    onMultiplicateButtonClicked: displayBlockId.termText = displayBlockId.termText + "*"
                    onMinusButtonClicked: displayBlockId.termText = displayBlockId.termText + "-"
                    onPlusButtonClicked: displayBlockId.termText = displayBlockId.termText + "+"
                    onCommaButtonClicked: displayBlockId.termText = displayBlockId.termText + "."
                    onOneButtonClicked: displayBlockId.termText = displayBlockId.termText + "1"
                    onTwoButtonClicked: displayBlockId.termText = displayBlockId.termText + "2"
                    onThreeButtonClicked: displayBlockId.termText = displayBlockId.termText + "3"
                    onFourButtonClicked: displayBlockId.termText = displayBlockId.termText + "4"
                    onFiveButtonClicked: displayBlockId.termText = displayBlockId.termText + "5"
                    onSixButtonClicked: displayBlockId.termText = displayBlockId.termText + "6"
                    onSevenButtonClicked: displayBlockId.termText = displayBlockId.termText + "7"
                    onEightButtonClicked: displayBlockId.termText = displayBlockId.termText + "8"
                    onNineButtonClicked: displayBlockId.termText = displayBlockId.termText + "9"
                    onZeroButtonClicked: displayBlockId.termText = displayBlockId.termText + "0"
                    onAnsButtonClicked: displayBlockId.termText = displayBlockId.termText + "ANS"
                    onResultButtonClicked: {
                        /* CALCULATE RESULT IN STANDARD AND SCIENTIFIC MODE */
                        if(!programmerModeActive)
                            calculateResult(displayBlockId.termText)
                        /* CALCULATE RESULT IN PROGRAMME MODE */
                        else{
                            /* DECIMAL */
                            if(decActive){
                                var decResult = calculateResult(displayBlockId.termText)
                                displayBlockId.hexInputText = displayBlockId.formatHex(math.decToHex(decResult.toString()));
                                displayBlockId.decInputText = decResult.toString()
                                displayBlockId.octInputText = displayBlockId.formatOct(math.decToOct(decResult.toString()));
                                displayBlockId.binInputText = displayBlockId.formatBin(math.decToBin(decResult.toString()));
                            }
                            /* HEXADECIMAL */
                            if(hexActive){
                                var hexInfixList = math.splitInfix(displayBlockId.termText);
                                var decInfix = ""
                                for(var i=0; i<hexInfixList.length; i++){
                                    if(math.isOperator(hexInfixList[i].charAt(0)))
                                        decInfix += hexInfixList[i]
                                    else
                                        decInfix += math.hexToDec(hexInfixList[i])
                                }
                                var hexResult = calculateResult(decInfix);
                                console.log(math.decToHex(hexResult.toString()));
                                displayBlockId.hexInputText = displayBlockId.formatHex(math.decToHex(hexResult.toString()));
                                displayBlockId.decInputText = hexResult.toString()
                                displayBlockId.octInputText = displayBlockId.formatOct(math.decToOct(hexResult.toString()));
                                displayBlockId.binInputText = displayBlockId.formatBin(math.decToBin(hexResult.toString()));
                            }
                            /* OCTAL */
                            if(octActive){
                                var octInfixList = math.splitInfix(displayBlockId.termText);
                                var octInfix = ""
                                for(var j=0; j<octInfixList.length; j++){
                                    if(math.isOperator(octInfixList[j].charAt(0)))
                                        octInfix += octInfixList[j]
                                    else
                                        octInfix += math.octToDec(octInfixList[j])
                                }
                                var octResult = calculateResult(octInfix);
                                displayBlockId.hexInputText = displayBlockId.formatHex(math.decToHex(octResult.toString()));
                                displayBlockId.decInputText = octResult.toString()
                                displayBlockId.octInputText = displayBlockId.formatOct(math.decToOct(octResult.toString()));
                                displayBlockId.binInputText = displayBlockId.formatBin(math.decToBin(octResult.toString()));
                            }
                            /* BINARY */
                            if(binActive){
                                var binInfixList = math.splitInfix(displayBlockId.termText);
                                var binInfix = ""
                                for(var k=0; k<binInfixList.length; k++){
                                    if(math.isOperator(binInfixList[k].charAt(0)))
                                        binInfix += binInfixList[k]
                                    else
                                        binInfix += math.binToDec(binInfixList[k])
                                }
                                var binResult = calculateResult(binInfix);
                                displayBlockId.hexInputText = displayBlockId.formatHex(math.decToHex(binResult.toString()));
                                displayBlockId.decInputText = binResult.toString()
                                displayBlockId.octInputText = displayBlockId.formatOct(math.decToOct(binResult.toString()));
                                displayBlockId.binInputText = displayBlockId.formatBin(math.decToBin(binResult.toString()));
                            }
                        }
                    }
                }

                ScientificBlock{
                    id: scientificBlockId
                    visible: false
                    /* scientific buttons slots */
                    onDegButtonClicked:{
                        math.setDegreeActivated(true);
                        setDegButtonActivated(true)
                    }
                    onRadButtonClicked:{
                        math.setDegreeActivated(false);
                        setDegButtonActivated(false)
                    }
                    onSinButtonClicked: displayBlockId.termText = displayBlockId.termText + "sin("
                    onCosButtonClicked: displayBlockId.termText = displayBlockId.termText + "cos("
                    onTanButtonClicked: displayBlockId.termText = displayBlockId.termText + "tan("
                    onArcsinButtonClicked: displayBlockId.termText = displayBlockId.termText + "arcsin("
                    onArccosButtonClicked: displayBlockId.termText = displayBlockId.termText + "arccos("
                    onArctanButtonClicked: displayBlockId.termText = displayBlockId.termText + "arctan("
                    onLnButtonClicked: displayBlockId.termText = displayBlockId.termText + "ln("
                    onLogButtonClicked: displayBlockId.termText = displayBlockId.termText + "log("
                    onLdButtonClicked: displayBlockId.termText = displayBlockId.termText + "ld("
                    onPiButtonClicked: displayBlockId.termText = displayBlockId.termText + math.getPiSymbol();
                    onEButtonClicked: displayBlockId.termText = displayBlockId.termText + "e"
                    onFactButtonClicked: displayBlockId.termText = displayBlockId.termText + "!"
                    onSquareRootButtonClicked: displayBlockId.termText = displayBlockId.termText + math.getSquareRootSymbol();
                    onAmountButtonClicked: displayBlockId.termText = displayBlockId.termText + "|"
                }
            }
        }
        /************* SECOND PAGE (FUNCTIONS) *****************/
        FunctionsCalculator
        {
            id: functionsCalculatorId
            Layout.fillHeight: true
            Layout.fillWidth: true
        }


    }
}

