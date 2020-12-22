import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fulldesigns/src/theme/theme_app.dart';
import 'package:fulldesigns/src/widgets/pinterest_menu.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Builder(
        builder: (BuildContext context) {
          bool show = Provider.of<_MenuModel>(context).mostrar;
          final theme = Provider.of<ThemeApp>(context).currentTheme;
          return Scaffold(
            body: Stack(
              children:[
                PinterestGrid(),
                Positioned(
                  child: Container(
                    width: (width>500)? width-300:width,
                    height: 100,
                    child: Row(
                      children: [
                        Spacer(),
                        PinterestMenu(
                          mostrar: show,
                          primary: theme.accentColor,
                          secondary: Colors.blueGrey,
                          items: [
                            PinterestButton(icon: Icons.pie_chart,onPressed:() => print('Icon pie')),
                            PinterestButton(icon: Icons.search,onPressed:() => print('Icon search')),
                            PinterestButton(icon: Icons.notification_important,onPressed:() => print('Icon notifications')),
                            PinterestButton(icon: Icons.ac_unit,onPressed:() => print('Icon ac')),
                          ],
                        ),
                        Spacer(),
                      ],
                    )
                  ),
                  bottom: 30,
                ),
              ]
            )
          );
        }
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {

  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> list = List.generate(100, (index) => index);
  ScrollController controller = ScrollController();
  double lastScroll = 0;

  @override
  void initState() {
    controller.addListener(() {
      if(controller.offset>lastScroll && controller.offset>0)
        Provider.of<_MenuModel>(context,listen: false).mostrar = false;
      else
        Provider.of<_MenuModel>(context,listen: false).mostrar = true;
      lastScroll = controller.offset;
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
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: (MediaQuery.of(context).size.width<500)?2:3,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) => StaggeredTile.count(1, index.isEven ? 2 : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final num index;
  const _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      )
    );
  }
}

class _MenuModel with ChangeNotifier{
  bool _mostrar = true;
   bool get mostrar => this._mostrar;
   set mostrar(value){
     this._mostrar = value;
     notifyListeners();
   }
}