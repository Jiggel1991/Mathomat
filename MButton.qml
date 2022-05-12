import QtQuick 2.0
import QtQuick.Layouts 1.3

Item {
    id: button
    width: 30
    height: 30
    property alias text: innerText.text;
    property color color: "white"
    property color hoverColor: "#aaaaaa"
    property color pressColor: "slategray"
    property int fontSize: 10
    property color textColor: "black"
    property bool fontBold: false
    property int borderWidth: 0
    property int borderRadius: 5
    property int p_anchorsMargins: 0
    property color borderColor: "black"
    property bool hoverEnabled: true
    property double scaleFactor: 0.96
    scale: state === "Pressed" ? scaleFactor : 1.0
    onEnabledChanged: state = ""
    signal clicked

    function setEnabled(state){
        button.hoverEnabled = state
        button.enabled = state
    }

    //define a scale animation
    Behavior on scale {
        NumberAnimation {
            duration: 100
            easing.type: Easing.InOutQuad

        }
    }

    //Rectangle to draw the button
    Rectangle {
        id: rectangleButton
        anchors.fill: parent
        radius: borderRadius
        color: button.enabled ? button.color : Qt.lighter(button.color, 1.65)
        border.width: borderWidth
        border.color: borderColor
        anchors.margins: p_anchorsMargins
        Text {
            id: innerText
            font.pointSize: fontSize
            font.bold: fontBold
            color: textColor
            anchors.centerIn: parent
            //text: "hol"
        }
    }

    //change the color of the button in differen button states
    states: [
        State {
            name: "Hovering"
            PropertyChanges {
                target: rectangleButton
                color: hoverColor
            }
        },
        State {
            name: "Pressed"
            PropertyChanges {
                target: rectangleButton
                color: pressColor
            }
        }
    ]

    //define  for the states
    transitions: [
        Transition {
            from: ""; to: "Hovering"
            ColorAnimation { duration: 200 }
        },
        Transition {
            from: "*"; to: "Pressed"
            ColorAnimation { duration: 10 }
        }
    ]

    //Mouse area to react on click events
    MouseArea {
        id: mouseAreaId
        hoverEnabled: button.hoverEnabled
        anchors.fill: button
        onEntered: { button.state='Hovering'}
        onExited: { button.state=''}
        onClicked: { button.clicked();}
        onPressed: { button.state="Pressed" }
        onReleased: {
            if (containsMouse)
              button.state="Hovering";
            else
              button.state="";
        }
    }
}
