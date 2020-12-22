import 'package:flutter/material.dart';
import 'package:fulldesigns/src/theme/theme_app.dart';
import 'package:provider/provider.dart';


class SliverListPage extends StatelessWidget {

  final List<_ListItem> items= [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];
 
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeApp>(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
             /*  SliverAppBar(
                floating: true,
                elevation: 0,
                backgroundColor:Colors.red,
                title:Text('hola'),
              ), */
              SliverPersistentHeader(
                floating: true,
                delegate: _SliverHeaderDelegate(
                  Container(alignment: Alignment.centerLeft, color: theme.currentTheme.scaffoldBackgroundColor, child: _Header()),150,150
                ),
              ),
              SliverList(
                //delegate: SliverChildListDelegate(items),
                delegate: SliverChildBuilderDelegate((context,i){
                  return items[i];
                },childCount: items.length),
              )
            ],
          ),
          Positioned(
            bottom: -10,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(20)),
              child: RaisedButton(
                color: theme.currentTheme.accentColor,
                child: Container(
                  //alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left:30),
                  width: 280,
                  height: 80,
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      Text(
                        'CREATE NEW LIST',
                        style: TextStyle(color:theme.currentTheme.scaffoldBackgroundColor,fontWeight: FontWeight.bold,fontSize: 15),
                      ),
                    ],
                  ),
                ),
                onPressed: () {  },
              ),
            )
          )
        ],
      )
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate{

  final double min;
  final double max;
  final Widget child;

  _SliverHeaderDelegate(this.child, this.min, this.max);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child:child);
  }

  @override
  double get maxExtent => max;

  @override
  double get minExtent => min;

  @override
  bool shouldRebuild(_SliverHeaderDelegate oldDelegate) {
    return max != oldDelegate.max ||
           min != oldDelegate.min ||
           child != oldDelegate.child;
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:60),
        Container(
          margin: EdgeInsets.symmetric(horizontal:30),
          child: Text('New',style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold,fontSize: 30),),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal:30),
          child: Text('List',style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold,fontSize: 30),),
        ),
      ],
    );
  }
}

class _ListItems extends StatelessWidget {

  final List<_ListItem> items= [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index]
    );
  }
}

class _ListItem extends StatelessWidget {

  final String text;
  final Color color;

  const _ListItem(@required this.text, @required this.color);

  @override
  Widget build(BuildContext context) {

    final theme = Provider.of<ThemeApp>(context);

    return Container(
      child: Text(text,style: TextStyle(color:theme.currentTheme.scaffoldBackgroundColor ,fontWeight:FontWeight.bold,fontSize: 15),),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(20),
      height: 120,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color:color,
        borderRadius:BorderRadius.circular(20)
      ),
    );
  }
}