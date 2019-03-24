import QtQuick 2.0

Canvas {
    id:mouth
    visible:true
    height:200
    opacity:0
    onPaint:{
        var ctx= getContext('2d');
        ctx.strokeStyle= Qt.rgba(0,0,0,1);
        ctx.lineWidth=7;
        ctx.beginPath();
        ctx.moveTo(0,0);
        ctx.bezierCurveTo(0,90,210,90,210,0);
        ctx.stroke();
    }//onPaint
}//Canvas
