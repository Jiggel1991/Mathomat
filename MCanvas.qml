import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item{
    id: rootId

    /** PROPERTIES **/
    property int gridSize: 10

    property var line: ({
        x1: 0,
        y1: 0,
        x2: 0,
        y2: 0
    })

    /** FUNCTIONS **/
    function drawLine(_x1, _y1, _x2, _y2)
    {
        var line = {}
        line.x1 = _x1
        line.y1 = _y1
        line.x2 = _x2
        line.y2 = _y2

        canvasId.iDrawLine(line)
    }

    function drawLines()
    {
        var line = {}
        line.x1 = 0
        line.y1 = 0
        line.x2 = 100
        line.y2 = 100
        var line2 = {}
        line2.x1 = 200
        line2.y1 = 200
        line2.x2 = 400
        line2.y2 = 400

        var _lines = [line, line2]
//        lines.push(line)
//        lines.push(line2)
        canvasId.iDrawLines(_lines)
    }

    function drawGrid()
    {
        canvasId.iDrawGrid()
    }
    Canvas
    {
        id: canvasId
        anchors.fill: parent
        onCanvasSizeChanged: iDrawGrid()
        function iDrawLine(_line)
        {
            var ctx = getContext("2d")
            ctx.lineWidth = 1;
            ctx.strokeStyle = "red"

            ctx.beginPath()

            ctx.moveTo(_line.x1, _line.y1)
            ctx.lineTo(_line.x2, _line.y2)

            ctx.stroke()
            canvasId.requestPaint()
        }

        function iDrawLines(_lines)
        {
            var ctx = getContext("2d")
            ctx.lineWidth = 1
            ctx.strokeStyle = "red"
            ctx.beginPath()
            console.log("x1: " + _lines[0].x1)
            console.log("y1: " + _lines[0].y1)
            console.log("x2: " + _lines[0].x2)
            console.log("y2: " + _lines[0].y2)
            console.log("x1: " + _lines[1].x1)
            console.log("y1: " + _lines[1].y1)
            console.log("x2: " + _lines[1].x2)
            console.log("y2: " + _lines[1].y2)
            var oldX = _lines.x1
            var oldY = _lines.y1

            for(var i=0; i<_lines.length; i++)
            {
                ctx.moveTo(_lines[i].x1, _lines[i].y1)
                ctx.lineTo(_lines[i].x2, _lines[i].y2)
//                oldX = _lines[i].x2
//                oldY = _lines[i].y2
            }

            ctx.closePath()
            ctx.stroke()
            canvasId.requestPaint()
//            var fruits = ["Apple", "Banane"]
//            fruits.push("Tomato")
//            console.log(fruits)
        }

        function iDrawGrid()
        {
            var ctx = getContext("2d")
            ctx.reset()
            ctx.lineWidth = 1;
            ctx.strokeStyle = "#e8e8e8"
            ctx.beginPath()

            /** VERTICAL LINES **/
            for(var i=0; i<rootId.width / gridSize / 2; i++)
            {
                ctx.moveTo((gridSize * i) + rootId.width / 2, 0)
                ctx.lineTo((gridSize * i) + rootId.width / 2, rootId.height)
            }
            for(var a=0; a<rootId.width / gridSize / 2; a++)
            {
                ctx.moveTo((-gridSize * a) + rootId.width / 2, 0)
                ctx.lineTo((-gridSize * a) + rootId.width / 2, rootId.height)
            }
            /** HORIZONTAL LINES **/
            for(var j=0; j<rootId.height / gridSize / 2; j++)
            {
                ctx.moveTo(0,            (gridSize * j) + rootId.height / 2)
                ctx.lineTo(rootId.width, (gridSize * j) + rootId.height / 2)
            }
            for(var b=0; b<rootId.height / gridSize; b++)
            {
                ctx.moveTo(0,            (-gridSize * b) + rootId.height / 2)
                ctx.lineTo(rootId.width, (-gridSize * b) + rootId.height / 2)
            }

            ctx.closePath()
            ctx.stroke()

            /** DRAW AXIS LABEL GRID **/
            ctx.beginPath()
            ctx.strokeStyle = "#bdbdbd"
            var axisLabelDistance = 100
            /** VERTICAL LINES **/
            for(var k=0; k<rootId.width / axisLabelDistance / 2; k++)
            {
                ctx.moveTo((axisLabelDistance * k) + rootId.width / 2, 0)
                ctx.lineTo((axisLabelDistance * k) + rootId.width / 2, rootId.height)
            }
            for(var l=0; l<rootId.width / axisLabelDistance / 2; l++)
            {
                ctx.moveTo((-axisLabelDistance * l) + rootId.width / 2, 0)
                ctx.lineTo((-axisLabelDistance * l) + rootId.width / 2, rootId.height)
            }
            /** HORIZONTAL LINES **/
            for(var m=0; m<rootId.height / axisLabelDistance / 2; m++)
            {
                ctx.moveTo(0,            (axisLabelDistance * m) + rootId.height / 2)
                ctx.lineTo(rootId.width, (axisLabelDistance * m) + rootId.height / 2)
            }
            for(var n=0; n<rootId.height / axisLabelDistance; n++)
            {
                ctx.moveTo(0,            (-axisLabelDistance * n) + rootId.height / 2)
                ctx.lineTo(rootId.width, (-axisLabelDistance * n) + rootId.height / 2)
            }
            ctx.closePath()
            ctx.stroke()
            /** DRAW CROSS **/
            ctx.beginPath()
            ctx.strokeStyle = "black"
            /** VERTICAL LINE **/
            console.log("width: " + rootId.width)
            console.log("height: " + rootId.height)
            ctx.moveTo(rootId.width / 2, 0)
            ctx.lineTo(rootId.width /2, rootId.height)
            /** HORIZONAL LINE **/
            ctx.lineWidth = 2
            ctx.moveTo(0, rootId.height / 2)
            ctx.lineTo(rootId.width, rootId.height / 2)

            ctx.closePath()
            ctx.stroke()
            canvasId.requestPaint()
        }
    }
}


