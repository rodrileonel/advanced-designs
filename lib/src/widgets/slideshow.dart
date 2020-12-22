import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool position; //por si quiero poner los puntos arriba
  final primaryColor;
  final secondaryColor;
  final double bulletSize;
  final double bulletSizeSmall;

  const Slideshow({
    @required this.slides,
    this.position = false,
    this.primaryColor = Colors.orange,
    this.secondaryColor = Colors.grey,
    this.bulletSize = 20,
    this.bulletSizeSmall =15,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _SliderModel(),
      child: Builder(//el widget builder me permite crear nuevo codigo sin extraer un nuevo
        builder: (BuildContext context) {
          Provider.of<_SliderModel>(context).primary = this.primaryColor;
          Provider.of<_SliderModel>(context).secondary = this.secondaryColor;
          Provider.of<_SliderModel>(context).bulletSize = this.bulletSize;
          Provider.of<_SliderModel>(context).bulletSizeSmall = this.bulletSizeSmall;
          return SafeArea(
            child: Center(
              child: Column(
                children: [
                  if(this.position == true) _Dots(this.slides.length),
                  Expanded(child: _Slides(this.slides)),
                  if(this.position == false) _Dots(this.slides.length),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Dots extends StatelessWidget {

  final int dots;

  const _Dots(this.dots);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //children: _list(dots),
        children : List.generate(dots, (index) => _Dot(index)),
      ),
    );
  }

  List<_Dot> _list(int dots) {
    var list = List<_Dot>() ;
    for (var i = 0; i < dots; i++) {
      list.add(_Dot(i));
    }
    return list;
  }
}

class _Dot extends StatelessWidget {

  final int index;

  const _Dot(this.index) ;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_SliderModel>(context);
    Color color;
    double bulletSize;
    if((provider.currentSlide.round() == index) ){
      bulletSize = provider.bulletSize;
      color = provider.primary;
    }else{
      bulletSize = provider.bulletSizeSmall;
      color = provider.secondary;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds:400),
      margin: EdgeInsets.symmetric(horizontal:8),
      width: bulletSize,
      height: bulletSize,
      decoration: BoxDecoration(
        color: color,
        shape:BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final controller = PageController();

  @override
  void initState() {
    controller.addListener(() {
      Provider.of<_SliderModel>(context,listen: false).currentSlide = controller.page;
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
        children: widget.slides.map((e) => _Slide(slide:e)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  const _Slide({Key key, this.slide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(40),
      child: slide
    );
  }
}

class _SliderModel with ChangeNotifier{
  double _currentSlide = 0;
  Color _primary;
  Color _secondary;
  double _bulletSize;
  double _bulletSizeSmall;

  double get currentSlide => this._currentSlide;
  set currentSlide(value){
    this._currentSlide = value;
    notifyListeners();
  }

  double get bulletSize => this._bulletSize;
  set bulletSize(value){
    this._bulletSize = value;
  }
  double get bulletSizeSmall => this._bulletSizeSmall;
  set bulletSizeSmall(value){
    this._bulletSizeSmall = value;
  }
  Color get primary => this._primary;
  set primary(value){
    this._primary = value;
  }
  Color get secondary => this._secondary;
  set secondary(value){
    this._secondary = value;
  }

}