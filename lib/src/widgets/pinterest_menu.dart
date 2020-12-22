import 'package:flutter/material.dart';
import 'package:fulldesigns/src/theme/theme_app.dart';
import 'package:provider/provider.dart';

class PinterestButton{
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    @required this.onPressed, 
    @required this.icon
  });
}

class PinterestMenu extends StatelessWidget {

  final bool mostrar;
  final Color primary;
  final Color secondary;
  final List<PinterestButton> items;

  PinterestMenu({
    this.mostrar = true,
    this.primary = Colors.orange,
    this.secondary = Colors.grey,
    @required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _PinterestModel(),
      child: Builder(
        builder: (BuildContext context){
          Provider.of<_PinterestModel>(context).primary = primary;
          Provider.of<_PinterestModel>(context).secondary = secondary;
          final theme = Provider.of<ThemeApp>(context).currentTheme;
          final width = MediaQuery.of(context).size.width;
          return AnimatedOpacity(
            duration: Duration(milliseconds:300),
            opacity: (mostrar) ?1:0,
            child: Container(
              child: _PinterestItems(items:items),
              width: (width>500) ? width *0.4 :width *0.6,
              height: 60,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color:Colors.black38,
                  spreadRadius: -5,
                  blurRadius:10
                )],
                borderRadius:BorderRadius.circular(100),
                color:theme.scaffoldBackgroundColor
              ),
            ),
          );
        }
      ),
    );
  }
}

class _PinterestItems extends StatelessWidget {
  final List<PinterestButton> items;
  const _PinterestItems({this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(this.items.length, (i) => _PinterestItem(i,items[i])),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestItem(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_PinterestModel>(context);
    return GestureDetector(
      onTap: (){
        Provider.of<_PinterestModel>(context,listen: false).selected = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,//el gesturedetector aveces falla en algunos dispositivos por lo que es bueno incluir esta opcion
      child: Icon(
        this.item.icon, 
        size: (provider.selected == index) ? 30 : 20,
        color: (provider.selected == index) ? provider.primary : provider.secondary,
      )
    );
  }
}

class _PinterestModel with ChangeNotifier{
  int _selected =0;
  Color _primary;
  Color _secondary;

  int get selected => this._selected;
  set selected(int value){
    this._selected = value;
    notifyListeners();
  }

  Color get primary => this._primary;
  set primary(Color value){
    this._primary = value;
  }

  Color get secondary => this._secondary;
  set secondary(Color value){
    this._secondary = value;
  }
}
