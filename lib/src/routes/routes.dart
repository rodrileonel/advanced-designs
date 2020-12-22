
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fulldesigns/src/pages/launcher_tablet_page.dart';
import 'package:fulldesigns/src/pages/slideshow_page.dart';
import 'package:fulldesigns/src/pages/animate_do_page.dart';
import 'package:fulldesigns/src/pages/animations_page.dart';
import 'package:fulldesigns/src/pages/circular_graphs_page.dart';
import 'package:fulldesigns/src/pages/emergency_page.dart';
import 'package:fulldesigns/src/pages/headers_page.dart';
import 'package:fulldesigns/src/pages/launcher_page.dart';
import 'package:fulldesigns/src/pages/pinterest_page.dart';
import 'package:fulldesigns/src/pages/sliver_page.dart';


final routes = {
  '/': (BuildContext context) => (MediaQuery.of(context).size.width>500)?
         LauncherTabletPage() : LauncherPage(),
  
  /*
  '/': (BuildContext context) => OrientationBuilder(
    builder: (BuildContext context, Orientation orientation) { 
      final screenSize = MediaQuery.of(context).size;
      if(screenSize.width>500)
        return LauncherTabletPage();
      else
        return LauncherPage();
    },
  ),
  */
  'HeadersPage': (BuildContext context) => HeadersPage(),
  'AnimationsPage': (BuildContext context) => AnimationsPage(),
  'CircularGraphsPage': (BuildContext context) => CircularGraphsPage(),
  'SlideshowPage': (BuildContext context) => SlideshowPage(),
  'PinterestPage': (BuildContext context) => PinterestPage(),
  'EmergencyPage': (BuildContext context) => EmergencyPage(),
  'SliverListPage': (BuildContext context) => SliverListPage(),
  'AnimateDoPage': (BuildContext context) => AnimateDoPage(),
};

final pages = [
  _Route(FontAwesomeIcons.heading, 'HeadersPage', HeadersPage()),
  _Route(FontAwesomeIcons.gift, 'AnimationsPage',AnimationsPage()),
  _Route(FontAwesomeIcons.circleNotch, 'CircularGraphsPage',CircularGraphsPage()),
  _Route(FontAwesomeIcons.slideshare, 'SlideshowPage',SlideshowPage()),
  _Route(FontAwesomeIcons.pinterest, 'PinterestPage',PinterestPage()),
  _Route(FontAwesomeIcons.ambulance, 'EmergencyPage',EmergencyPage()),
  _Route(FontAwesomeIcons.mobile, 'SliverListPage',SliverListPage()),
  _Route(FontAwesomeIcons.angellist, 'AnimateDoPage',AnimateDoPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget widget;

  _Route(this.icon, this.title, this.widget);
}