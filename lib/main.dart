import 'package:flutter/material.dart';
import 'package:fulldesigns/src/models/launcher_model.dart';
import 'package:fulldesigns/src/pages/launcher_page.dart';
import 'package:fulldesigns/src/routes/routes.dart';
import 'package:fulldesigns/src/theme/theme_app.dart';
import 'package:provider/provider.dart';


void main() => runApp(
  MultiProvider(providers: [
    ChangeNotifierProvider<ThemeApp>( create: (_) => ThemeApp(2),),
    ChangeNotifierProvider<LauncherModel>( create: (_) => LauncherModel(),),
  ],child: MyApp())
);

//para detectar si estamos en portrait o landscape podemos usar 
//el OrientationBuilder, pero es mejor trabajar en base a resoluciones
//sin embargo el Orientation builder nos ayuda a detectar los cambios de pantalla
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeApp>(context);
    return MaterialApp(
      theme: theme.currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Designs',
      initialRoute: '/',
      routes: routes,
    );
  }
}