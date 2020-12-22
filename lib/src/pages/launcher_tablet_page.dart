import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fulldesigns/src/models/launcher_model.dart';
import 'package:fulldesigns/src/pages/slideshow_page.dart';
import 'package:fulldesigns/src/routes/routes.dart';
import 'package:fulldesigns/src/theme/theme_app.dart';
import 'package:provider/provider.dart';


class LauncherTabletPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeApp>(context).currentTheme;
    final page = Provider.of<LauncherModel>(context).page;
    return Scaffold(
      appBar: AppBar(title: Text('Full Designs Tablet'),),
      drawer: _MainMenu(),
      body: Row(
        children: [
          Container(width: 300, child: _ListOptions()),
          Container(width: 1, color: theme.accentColor,),
          Expanded(child: page)
        ],
      ),
   );
  }
}

class _ListOptions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeApp>(context).currentTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: pages.length,
      separatorBuilder: (c,i) => Divider(color:theme.accentColor), 
      itemBuilder: (c,i) => ListTile(
        leading:Icon(pages[i].icon, color: theme.accentColor,),
        trailing: Icon(Icons.chevron_right,color: theme.accentColor,),
        title: Text(pages[i].title,),
        onTap: () {
          Provider.of<LauncherModel>(context,listen: false).page = pages[i].widget;
          //Navigator.pushNamed(context, pages[i].title);
        },
      ), 
    );
  }
}

class _MainMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeApp>(context);
    return Drawer(
      child: SafeArea(
        child: Column(
          children:[
            Container(
              width: double.infinity,
              height: 100,
              child:CircleAvatar(
                child: Text('RV',style: TextStyle(fontSize:40),),
              )
            ),
            Expanded(child: _ListOptions()),
            ListTile(
              leading:Icon(FontAwesomeIcons.solidLightbulb,color: theme.currentTheme.accentColor,),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: theme.darkTheme, 
                activeColor: theme.currentTheme.accentColor,
                onChanged: (value) => theme.darkTheme = value,
              ),
            ),
            ListTile(
              leading:Icon(FontAwesomeIcons.home,color: theme.currentTheme.accentColor,),
              title: Text('Custom'),
              trailing: Switch.adaptive(
                value: theme.customTheme, 
                activeColor: theme.currentTheme.accentColor,
                onChanged: (value) => theme.customTheme = value,
              ),
            ),
          ]
        ),
      )
    );
  }
}