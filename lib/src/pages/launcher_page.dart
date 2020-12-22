import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fulldesigns/src/routes/routes.dart';
import 'package:fulldesigns/src/theme/theme_app.dart';
import 'package:provider/provider.dart';


class LauncherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Full Designs Phone'),),
      drawer: _MainMenu(),
      body: _ListOptions(),
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
          Navigator.pushNamed(context, pages[i].title);
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