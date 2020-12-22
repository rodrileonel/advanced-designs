import 'package:flutter/material.dart';
import 'package:fulldesigns/src/pages/slideshow_page.dart';

class LauncherModel with ChangeNotifier{
  Widget _page = SlideshowPage();

  Widget get page => this._page;
  set page(value){
    this._page = value;
    notifyListeners();
  }
}