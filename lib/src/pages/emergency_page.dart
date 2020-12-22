import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fulldesigns/src/widgets/button_big.dart';
import 'package:fulldesigns/src/widgets/headers.dart';


class EmergencyPage extends StatelessWidget {

  final List<BigButton> listButtons = [
    BigButton(
      icon: FontAwesomeIcons.carCrash, 
      color1: Colors.purple,
      color2: Colors.deepPurple,
      text: 'Motor Accident',
      onPress:() => print('Motor Accident'),
    ),
    BigButton(
      icon: FontAwesomeIcons.plus, 
      color1: Color(0xff66A9F2),
      color2: Color(0xff536CF6),
      text: 'Medical Emergency',
      onPress:() => print('Medical Emergency'),
    ),
    BigButton(
      icon: FontAwesomeIcons.theaterMasks, 
      color1: Color(0xffF2D572),
      color2: Color(0xffE06AA3),
      text: 'Theft / Harrasement',
      onPress:() => print('Theft / Harrasement'),
    ),
    BigButton(
      icon: FontAwesomeIcons.biking, 
      color1: Color(0xff317183),
      color2: Color(0xff46997D),
      text: 'Awards',
      onPress:() => print('Awards'),
    ),
    BigButton(
      icon: FontAwesomeIcons.carCrash, 
      color1: Colors.purple,
      color2: Colors.deepPurple,
      text: 'Motor Accident',
      onPress:() => print('Motor Accident'),
    ),
    BigButton(
      icon: FontAwesomeIcons.plus, 
      color1: Color(0xff66A9F2),
      color2: Color(0xff536CF6),
      text: 'Medical Emergency',
      onPress:() => print('Medical Emergency'),
    ),
    BigButton(
      icon: FontAwesomeIcons.theaterMasks, 
      color1: Color(0xffF2D572),
      color2: Color(0xffE06AA3),
      text: 'Theft / Harrasement',
      onPress:() => print('Theft / Harrasement'),
    ),
    BigButton(
      icon: FontAwesomeIcons.biking, 
      color1: Color(0xff317183),
      color2: Color(0xff46997D),
      text: 'Awards',
      onPress:() => print('Awards'),
    ),
    BigButton(
      icon: FontAwesomeIcons.carCrash, 
      color1: Colors.purple,
      color2: Colors.deepPurple,
      text: 'Motor Accident',
      onPress:() => print('Motor Accident'),
    ),
    BigButton(
      icon: FontAwesomeIcons.plus, 
      color1: Color(0xff66A9F2),
      color2: Color(0xff536CF6),
      text: 'Medical Emergency',
      onPress:() => print('Medical Emergency'),
    ),
    BigButton(
      icon: FontAwesomeIcons.theaterMasks, 
      color1: Color(0xffF2D572),
      color2: Color(0xffE06AA3),
      text: 'Theft / Harrasement',
      onPress:() => print('Theft / Harrasement'),
    ),
    BigButton(
      icon: FontAwesomeIcons.biking, 
      color1: Color(0xff317183),
      color2: Color(0xff46997D),
      text: 'Awards',
      onPress:() => print('Awards'),
    ),
    BigButton(
      icon: FontAwesomeIcons.carCrash, 
      color1: Colors.purple,
      color2: Colors.deepPurple,
      text: 'Motor Accident',
      onPress:() => print('Motor Accident'),
    ),
    BigButton(
      icon: FontAwesomeIcons.plus, 
      color1: Color(0xff66A9F2),
      color2: Color(0xff536CF6),
      text: 'Medical Emergency',
      onPress:() => print('Medical Emergency'),
    ),
    BigButton(
      icon: FontAwesomeIcons.theaterMasks, 
      color1: Color(0xffF2D572),
      color2: Color(0xffE06AA3),
      text: 'Theft / Harrasement',
      onPress:() => print('Theft / Harrasement'),
    ),
    BigButton(
      icon: FontAwesomeIcons.biking, 
      color1: Color(0xff317183),
      color2: Color(0xff46997D),
      text: 'Awards',
      onPress:() => print('Awards'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _ListaBotones(listButtons: listButtons),
          (MediaQuery.of(context).size.height >500)?_Header():Container(),
          _Puntitos()
        ],
      )
   );
  }
}

class _ListaBotones extends StatelessWidget {
  
  const _ListaBotones({@required this.listButtons}) ;

  final List<BigButton> listButtons;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(), //esto es para hacer el mismso efecto de lista de ios en android
      padding: (MediaQuery.of(context).size.height <500)? EdgeInsets.only(top:MediaQuery.of(context).size.height *0.06) :EdgeInsets.only(top:MediaQuery.of(context).size.height *0.3),
      children:[
        SizedBox(height:20),//esto lo puedo quitar es solo para probar el spread (...)
        ...listButtons.map((e) //... operador spread para colorcar un listado si es que la lista tiene otros elementos
                        => FadeInLeft(child:e)) //agrego animacion a cada boton
      ]
    );
  }
}

class _Puntitos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 0,
      child: SafeArea(
        child: RawMaterialButton(
          onPressed: () {  },
          shape: CircleBorder(),
          padding: EdgeInsets.all(10),
          child: Icon(FontAwesomeIcons.ellipsisV,color: Colors.white,)
        )
      )
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmergencyHeader(
      title: 'Has solicitado',
      subtitle: 'Asistencia Médica',
      icon: FontAwesomeIcons.plusCircle,
    );
  }
}