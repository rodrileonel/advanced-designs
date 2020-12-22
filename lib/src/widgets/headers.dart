import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderSquare extends StatelessWidget {
  const HeaderSquare({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.orange,
    );
  }
}

class HeaderRounded extends StatelessWidget {
  const HeaderRounded({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius:BorderRadius.only(bottomLeft:Radius.circular(50),bottomRight:Radius.circular(50)),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      //lapiz
      final paint = Paint();
      //propiedades del lapiz
      paint.color =  Colors.orange;
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5;

      final path = Path();
      path.moveTo(0, size.height*0.35);
      path.lineTo(size.width, size.height*0.3);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);

      canvas.drawPath(path, paint);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
      throw true;
    }
}

class HeaderTriangle extends StatelessWidget {
  const HeaderTriangle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      
      child: CustomPaint(
        painter: _HeaderTrianglePainter(),
      ),
    );
  }
}

class _HeaderTrianglePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      final paint = Paint();
      paint.color =  Colors.orange;
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5;

      final path = Path();
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
      canvas.drawPath(path, paint);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
      throw true;
    }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      final paint = Paint();
      paint.color =  Colors.orange;
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5;

      final path = Path();
      path.lineTo(0, size.height*0.30);
      path.lineTo(size.width*0.5, size.height*0.35);
      path.lineTo(size.width, size.height*0.3);
      path.lineTo(size.width, 0);
      canvas.drawPath(path, paint);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
      throw true;
    }
}

class HeaderDiagonalBad extends StatelessWidget {
  const HeaderDiagonalBad({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.3,
      child: Container(
        height: 300,
        color: Colors.orange,
      ),
    );
  }
}

class HeaderCircle extends StatelessWidget {
  const HeaderCircle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      
      child: CustomPaint(
        painter: _HeaderCirclePainter(),
      ),
    );
  }
}

class _HeaderCirclePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      final paint = Paint();
      paint.color =  Colors.orange;
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5;

      final path = Path();
      path.lineTo(0, size.height*0.3);
      path.quadraticBezierTo(size.width*0.5, size.height*0.4, size.width, size.height*0.3);
      path.lineTo(size.width, 0);

      canvas.drawPath(path, paint);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
      throw true;
    }
}

class HeaderWaves extends StatelessWidget {
  const HeaderWaves({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      
      child: CustomPaint(
        painter: _HeaderWavesPainter(),
      ),
    );
  }
}

class _HeaderWavesPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      final paint = Paint();
      paint.color =  Colors.orange;
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5;

      final path = Path();
      path.lineTo(0, size.height*0.3);
      path.quadraticBezierTo(size.width*0.25, size.height*0.35, size.width*0.5, size.height*0.3);
      path.quadraticBezierTo(size.width*0.75, size.height*0.25, size.width, size.height*0.3);
      path.lineTo(size.width, 0);

      canvas.drawPath(path, paint);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
      throw true;
    }
}

class HeaderGradientWaves extends StatelessWidget {
  const HeaderGradientWaves({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      
      child: CustomPaint(
        painter: _HeaderWavesGradientPainter(),
      ),
    );
  }
}

class _HeaderWavesGradientPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    
    final Rect rect = Rect.fromCircle(
      center: Offset(150,150),
      radius: 180,
    );

    final Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.red,
        Colors.deepOrange,
        Colors.orangeAccent
      ],
      stops: [ 0.0, 0.5, 1 ]
    );
  
    final paint = Paint()..shader = gradient.createShader(rect);
    //paint.shader = gradient.createShader(rect);
    //paint.color =  Colors.orange;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();
    path.lineTo(0, size.height*0.3);
    path.quadraticBezierTo(size.width*0.25, size.height*0.35, size.width*0.5, size.height*0.3);
    path.quadraticBezierTo(size.width*0.75, size.height*0.25, size.width, size.height*0.3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class EmergencyHeader extends StatelessWidget {

  final String title,subtitle;
  final IconData icon;

  EmergencyHeader({
    this.title = 'Titulo', 
    this.subtitle = 'Subtitulo', 
    this.icon  = FontAwesomeIcons.plus
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _EmergencyHeaderBackground(),
        Positioned(
          top: -30,
          left: -50,
          child: FaIcon(icon, size: 200,color: Colors.white.withOpacity(0.2),),
        ),
        Center(
          child: Column(
            children:[
              SizedBox(height:80),
              Text(title, style:TextStyle(
                color: Colors.white,
                fontSize: 20
              )),
              SizedBox(height:10),
              Text(subtitle, style:TextStyle(
                color: Colors.white,
                fontSize: 30
              )),
              SizedBox(height:10),
              FaIcon(icon, size: 70,color: Colors.white,)
            ]
          ),
        )
      ],
    );
  }
}

class _EmergencyHeaderBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height *0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30)),
        gradient: LinearGradient(
          colors: [
            Colors.white70,
            Colors.blueAccent,
          ],
          stops: [0.1,0.5],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
    );
  }
}