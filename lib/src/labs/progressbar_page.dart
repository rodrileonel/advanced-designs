import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ProgressBarlPage extends StatefulWidget {

  @override
  _ProgressBarlPageState createState() => _ProgressBarlPageState();
}

class _ProgressBarlPageState extends State<ProgressBarlPage> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  double percentage=0;
  double newPercentage=0;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds:800)
    );

    animationController.addListener(() {
      print('valor del animated ${animationController.value}');
      print('valor del percentage ----$percentage');
      print('valor del newPercentage ----$newPercentage');
      setState(() {
        //percentage = animationController.value*10 + newPercentage;
        percentage = lerpDouble(percentage, newPercentage, animationController.value);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: _Circle(percentage: percentage),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _addPercentage(),
          SizedBox(height: 10,),
          _lessPercentage(),
        ],
      ),
    );
  }

  Widget _addPercentage() {
    return FloatingActionButton(
      backgroundColor: Colors.orange,
      onPressed: () { 
        setState(() {
          percentage = newPercentage;
          animationController.forward(from: 0);
          if(percentage<100)
            newPercentage = newPercentage + 10;
        });
       },
      child: Icon(Icons.add),
    );
  }
  Widget _lessPercentage() {
    return FloatingActionButton(
      backgroundColor: Colors.orange,
      onPressed: () { 
        setState(() {
          animationController.forward(from: 0);
          percentage = newPercentage;
          if(percentage>0)
            newPercentage = newPercentage - 10;
        });
       },
      child: Icon(Icons.minimize),
    );
  }
}

class _Circle extends CustomPainter{

  final percentage;

  _Circle({@required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {

    //circulo primario
    final paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3
    ..color = Colors.black;

    final center = Offset(size.width*0.5,size.height*0.5);
    final radius = min(size.width*0.5, size.height*0.5);

    canvas.drawCircle(center, radius, paint);

    //ahora el circulo secundario
    final paintSecondary = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..color = Colors.orange;

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