import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class NotificationsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        floatingActionButton: _FloatingButton(),
        bottomNavigationBar: _NavigationBar(),
        body: Center(
          child: Text('Hola Mundo'),
        ),
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {

  final Color orange = Colors.orange[900];

  @override
  Widget build(BuildContext context) {

    int number = Provider.of<_NotificationModel>(context).number;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: orange,
      items: [
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.dog),label: 'Dogs'),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.cat),label: 'Cats'),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Icon(FontAwesomeIcons.solidBell),
              Positioned(
                right: 0,
                top: 0,
                child: (number==0)? Container(): Bounce(
                  from:10,
                  controller: (c)=>Provider.of<_NotificationModel>(context).controller = c,
                  child: Container(
                    alignment: Alignment.center,
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color:orange,
                      shape: BoxShape.circle
                    ),
                    child: Text('$number',style:TextStyle(color: Colors.white,fontSize:10)),
                  ),
                )
              ),
            ],
          ),
          label: 'Notifications'
        ),
      ]
    );
  }
}

class _FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.orange[900],
      onPressed: () {
        final provider = Provider.of<_NotificationModel>(context,listen: false);
        provider.number++;
        if(provider.number >=2){
          final controller = provider.controller;
          controller.forward(from:0);
        }
      },
      child: FaIcon(FontAwesomeIcons.play,),
    );
  }
}

class _NotificationModel extends ChangeNotifier{
  int _number =0;
  AnimationController _controller;

  int get number => this._number;
  set number(value) {
    this._number = value;
    notifyListeners();
  }

  AnimationController get controller => this._controller;
  set controller(value){
    this._controller = value;
  }
}