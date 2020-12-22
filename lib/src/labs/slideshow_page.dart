import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fulldesigns/src/models/slider_model.dart';
import 'package:provider/provider.dart';


class SlideshowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(child: _Slides()),
              _Dots(),
            ],
          )
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(index:0),
          _Dot(index:1),
          _Dot(index:2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  const _Dot({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final current = Provider.of<SliderModel>(context).currentSlide;
    return AnimatedContainer(
      duration: Duration(milliseconds:200),
      margin: EdgeInsets.symmetric(horizontal:8),
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        color: (current.round() == index) ?Colors.orange:Colors.grey,
        shape:BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final controller = PageController();

  @override
  void initState() {
    controller.addListener(() {
      Provider.of<SliderModel>(context,listen: false).currentSlide = controller.page;
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
    return Container(
      child: PageView(
        controller: controller,
        children:[
          _Slide(slide: 'assets/1.svg',),
          _Slide(slide: 'assets/2.svg',),
          _Slide(slide: 'assets/3.svg',),
          _Slide(slide: 'assets/4.svg',),
          _Slide(slide: 'assets/5.svg',),
        ]
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String slide;

  const _Slide({Key key, this.slide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(40),
      child: SvgPicture.asset(slide)
    );
  }
}