import 'dart:math';

import 'package:flutter/material.dart';

class AnimationsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AnimarCuadrado())
    );
  }
}

class AnimarCuadrado extends StatefulWidget {
  @override
  _AnimarCuadradoState createState() => _AnimarCuadradoState();
}

class _AnimarCuadradoState extends State<AnimarCuadrado> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> rotate;
  Animation<double> fadeIn;
  Animation<double> fadeOut;
  Animation<double> move;
  Animation<double> big;
  Animation<double> move2;
  Animation<double> move3;
  Animation<double> move4;

  @override
  void initState() {
    controller = AnimationController(
      //vertical sync permite que vaya la animacion segun cada cuadro de la pantalla; es decir que vaya a 60 o 90 fps
      vsync: this,//el this apunta al SingleTickerProviderStateMixin, que requiere el vsync
      //duracion de la animacion
      duration: Duration(milliseconds:4000),
    );

    //creo una animacion que varie de 0 a 2; y le aplico el controlador
    //rotate = Tween(begin: 0.0,end: 2 * pi).animate(controller);
    //puedo multiplicar por pi de dart/math para que gire 180 grados exactemente
    //como es *2 girara una vuelta completa

    //tambien puedo aplicar un curve
    rotate = Tween(begin: 0.0,end: 2.0 * pi).animate(
      CurvedAnimation(parent:controller,curve: Curves.bounceIn),
    );

    /*
    opacity = Tween(begin: 0.1,end: 1.0).animate(
      CurvedAnimation(parent:controller,curve: Curves.easeOut),
    );
    */

    fadeIn = Tween(begin: 0.0,end: 1.0).animate(
      //va de 0 a 1 donde 1 son los 4 segundos, asi que 0.25 es 1 segundo
      CurvedAnimation(parent:controller,curve: Interval(0, 0.25, curve: Curves.easeOut)),
    );
    fadeOut = Tween(begin: 1.0,end: 0.0).animate(
      //va de 0 a 1 donde 1 son los 4 segundos, asi que 0.25 es 1 segundo
      CurvedAnimation(parent:controller,curve: Interval(0.9, 1.0, curve: Curves.easeOut)),
    );
    move = Tween(begin: 0.0,end: 200.0).animate(
      CurvedAnimation(parent:controller,curve: Interval(0.0, 0.25,curve:Curves.easeInCirc)),
    );
    big = Tween(begin: 0.0,end: 2.0).animate(
      CurvedAnimation(parent:controller,curve: Curves.easeInCirc),
    );
    move2 = Tween(begin: 0.0,end: 200.0).animate(
      CurvedAnimation(parent:controller,curve: Interval(0.25, 0.5,curve:Curves.easeInCirc)),
    );
    move3 = Tween(begin: 0.0,end: 200.0).animate(
      CurvedAnimation(parent:controller,curve: Interval(0.5, 0.75,curve:Curves.easeInCirc)),
    );
    move4 = Tween(begin: 0.0,end: 400.0).animate(
      CurvedAnimation(parent:controller,curve: Interval(0.75, 1,curve:Curves.easeInCirc)),
    );


    //adicionalmente podemos añadir listener a nuestro controller
    controller.addListener(() {
      //if(controller.status == AnimationStatus.completed)
        //controller.reverse();
      //else if (controller.status == AnimationStatus.dismissed)
        //controller.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //con esto inicializo la reproduccion de la animacion
    //controller.forward();

    //puedo hacer un repeat para que haga un loop en la animacion
    controller.repeat();

    return AnimatedBuilder(
      animation: controller,
      child: _Cuadrado(), // este argumento es opcional, porque se puede usar en el builder, pero siempre es mejor usarlo aqui porque se construye una vez y se pasa por referencia
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(move.value-move3.value,-move2.value+move4.value),
          child: Transform.rotate(
            angle: rotate.value,
            child: Transform.scale(
              scale: big.value,
              child: Opacity(
                opacity: fadeIn.value,
                child: Opacity(
                  opacity: fadeOut.value,
                  child: child
              ),
              ),
            )
          ),
        );
      },
    );
  }
}


class _Cuadrado extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.orange
       ),
     );
   }
}