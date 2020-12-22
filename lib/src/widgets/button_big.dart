import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BigButton extends StatelessWidget {

  final IconData icon;
  final Color color1;
  final Color color2;
  final String text;
  final Function onPress;

  final rounded = BorderRadius.circular(20);

  BigButton({
    this.icon = FontAwesomeIcons.carCrash, 
    this.color1 = Colors.purple,
    this.color2 = Colors.deepPurple,
    this.text = '',
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        child: ClipRRect(
          borderRadius: rounded,
          child: Stack(
            children:[
              Positioned(
                right: -20,
                top: -20,
                child: FaIcon(icon,size:150,color:Colors.white.withOpacity(0.2)),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    SizedBox(width:20),
                    Icon(icon,size: 40,color: Colors.white,),
                    SizedBox(width:30),
                    Expanded(child: Text(text,style: TextStyle(color:Colors.white,fontSize:20),)),
                    Icon(Icons.arrow_forward_ios_rounded,size: 40,color: Colors.white,),
                    SizedBox(width:20)
                  ]
                ),
              )
            ]
          ),
        ),
        width: double.infinity,
        height: 100,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: rounded,
          gradient: LinearGradient(colors: [
            color1,
            color2,
          ]),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.5),blurRadius: 10,offset: Offset(4,6))
          ]
        ),
      ),
    );
  }
}