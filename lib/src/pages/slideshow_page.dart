import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fulldesigns/src/theme/theme_app.dart';
import 'package:fulldesigns/src/widgets/slideshow.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:(size.height>size.width) ? 
        Column( children: [
          SlideshowItem(), 
          SlideshowItem(),
        ],) :
        Row( children: [
          SlideshowItem(), 
          SlideshowItem(),
        ],)
    );
  }
}

class SlideshowItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeApp>(context).currentTheme;
    return Expanded(
      child: Slideshow(
        bulletSize: 15,
        bulletSizeSmall: 5,
        primaryColor: theme.accentColor,
        secondaryColor: Colors.grey,
        slides: [
          SvgPicture.asset('assets/1.svg'),
          SvgPicture.asset('assets/2.svg'),
          SvgPicture.asset('assets/3.svg'),
          SvgPicture.asset('assets/4.svg'),
          SvgPicture.asset('assets/5.svg'),
        ],
      ),
    );
  }
}