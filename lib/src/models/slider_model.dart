import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier{
  double _currentSlide = 0;

  double get currentSlide => this._currentSlide;
  set currentSlide(value){
    this._currentSlide = value;
    notifyListeners();
  }
}