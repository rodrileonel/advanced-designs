import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgress extends StatefulWidget {

  final double percentage;
  final Color color;
  final Color back;

  CircularProgress({
    @required this.percentage,
    this.color = Colors.orange, 
    this.back = Colors.black,
  });

  @override
  _CircularProgressState createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> with SingleTickerProviderStateMixin{
  
  AnimationController controller;
  double oldPercentage;

  @override
  void initState() {
    oldPercentage = widget.percentage;
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds:700),
    );
    controller.addListener(() {
      //print('valor del animated ${controller.value}');
      //print('valor del oldPercentage ----$oldPercentage');
      //percentage=lerpDouble(widget.percentage, newPercentage, controller.value);
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0);

    final diferencia = widget.percentage - oldPercentage;
    oldPercentage = widget.percentage;
    
    return Container(
      margin: EdgeInsets.all(10),
      child: AnimatedBuilder(
        animation: controller, 
        builder: (BuildContext context, Widget child){
          return Stack(
            fit: StackFit.expand,
            overflow: Overflow.clip,
            children: [
              Center(child: Text('${((widget.percentage - diferencia) + (diferencia*controller.value)).toInt()} %')),
              CustomPaint(
                painter: _Circle(
                  percentage: (widget.percentage - diferencia) + (diferencia*controller.value),
                  color: widget.color,
                  back : widget.back
                ),
              ),
            ],
          );
        }
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _Circle extends CustomPainter{

  final percentage;
  final color;
  final back;

  _Circle({@required this.percentage, @required this.color, @required this.back});

  @override
  void paint(Canvas canvas, Size size) {

    //circulo primario
    final paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..color = back;

    final center = Offset(size.width*0.5,size.height*0.5);
    final radius = min(size.width*0.5, size.height*0.5);

    canvas.drawCircle(center, radius, paint);

    /////en caso de quierer aplica<r un gradiente
    final Rect rect = Rect.fromCircle(
      center:Offset(0,0),
      radius: 180,
    );
    final gradient = LinearGradient(colors: [
        Colors.purpleAccent,
        color
    ]);
    /////

    //ahora el circulo secundario
    final paintSecondary = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round //borde redondeado 
    ..strokeWidth = 10
    //..color = color;
    ..shader = gradient.createShader(rect);//en caso de querer un gradiente

    double arcAngle = 2*pi*(percentage/100);

    canvas.drawArc(
      Rect.fromCircle(center:center,radius:radius), 
      -pi/2, 
      arcAngle, 
      false,
      paintSecondary
    );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}