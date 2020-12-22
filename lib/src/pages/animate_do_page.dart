import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fulldesigns/src/pages/animate_do_twitter_page.dart';

import 'animate_do_notifications_page.dart';


class AnimateDoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Animate do'),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return TwitterPage(); }))),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.solidBell),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return NotificationsPage(); }))),
        ],
      ),
      floatingActionButton: ElasticInRight(
        from: 50,//parta que la animacion no sea tan larga
        child: FloatingActionButton(
          onPressed: (){},
          child: FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            ElasticIn(
              delay: Duration(milliseconds:200),
              child: FaIcon(FontAwesomeIcons.plug,color: Colors.orange,size: 60,)
            ),
            SizedBox(height:20),
            FadeInDown(
              delay: Duration(milliseconds:400),
              child: Text('Title',style: TextStyle(fontSize:40, fontWeight: FontWeight.bold),)
            ),
            FadeInLeft(
              delay: Duration(milliseconds:800),
              child: Text('SubTitle',style: TextStyle(fontSize:20),)
            ),
            FadeInRight(
              delay: Duration(milliseconds:800),
              child: Container(color: Colors.orange,width: 200,height: 2,)
            )
          ]
        ),
      ),
    );
  }
}