import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item{
    id: rootId

    /** PROPERTIES **/
    property int x1: 0
    property int y1: 0
    property int x2: 0
    property int y2: 0
    property int gridSize: 10

    /** FUNCTIONS **/
    function drawLine(_x1, _y1, _x2, _y2)
    {
        x1 = _x1
        y1 = _y1
        x2 = _x2
        y2 = _y2
        canvasId.iDrawLine()
    }

    property var line: ({
        x1: 0,
        y1: 0,
        x2: 0,
        y2: 0
    })

    function drawLines(_lines)
    {

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
        function iDrawLine()
        {
            var ctx = getContext("2d")
            ctx.lineWidth = 1;
            ctx.strokeStyle = "red"

            ctx.beginPath()

            ctx.moveTo(x1, y1)
            ctx.lineTo(x2, y2)

            ctx.stroke()
            canvasId.requestPaint()
        }

        function iDrawLines()
        {

        }

        function iDrawGrid()
        {
            var ctx = getContext("2d")
            ctx.reset()
            ctx.lineWidth = 1;
            ctx.strokeStyle = "#e8e8e8"
            ctx.beginPath()
//            var remainderWidth =  (rootId.width) % gridSize
//            var remainderHeight = (rootId.height) % gridSize
//            console.log("remainderWidth: " + remainderWidth)
//            console.log("remainderWidth: " + remainderWidth / 2)
//            /** VERTICAL LINES **/
//            for(var i=0; i<rootId.width / gridSize; i++)
//            {
//                ctx.moveTo((gridSize * i) + remainderWidth / 2, 0)
//                ctx.lineTo((gridSize * i) + remainderWidth / 2, rootId.height)
//            }
//            /** HORIZONTAL LINES **/
//            for(var j=0; j<rootId.height / gridSize; j++)
//            {
//                //console.log((gridSize * j) + remainderHeight / 2)
//                ctx.moveTo(0,            (gridSize * j) + remainderHeight / 2)
//                ctx.lineTo(rootId.width, (gridSize * j) + remainderHeight / 2)
//            }
//            ctx.closePath()
//            ctx.stroke()
//            /** DRAW AXIS LABEL GRID **/
//            ctx.beginPath()
//            ctx.strokeStyle = "#bdbdbd"
//            var axisLabelDistance = 100
//            remainderWidth = (rootId.width) % axisLabelDistance
//            remainderHeight = (rootId.height) % axisLabelDistance
//            console.log("remainderWidth: " + remainderWidth)
//            console.log("remainderWidth: " + remainderWidth / 2)
//            /** VERTICAL LINES **/
//            for(var k=0; k<rootId.width / axisLabelDistance; k++)
//            {
//                ctx.moveTo((axisLabelDistance * k) + remainderWidth / 2, 0)
//                ctx.lineTo((axisLabelDistance * k) + remainderWidth / 2, rootId.height)
//            }
//            /** HORIZONTAL LINES **/
//            for(var l=0; l<rootId.height / axisLabelDistance; l++)
//            {
//                ctx.moveTo(0,            (axisLabelDistance * l) + remainderHeight / 2)
//                ctx.lineTo(rootId.width, (axisLabelDistance * l) + remainderHeight / 2)
//            }
//            ctx.stroke()



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
            ctx.moveTo(rootId.width / 2, 0)
            ctx.lineTo(rootId.width /2, rootId.height)
            /** HORIZONAL LINE **/
            ctx.moveTo(0, rootId.height / 2)
            ctx.lineTo(rootId.width, rootId.height / 2)

            ctx.stroke()
            canvasId.requestPaint()
        }
    }
}


