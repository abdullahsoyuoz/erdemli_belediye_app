import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';

class MainPageIndexer extends ChangeNotifier {
  int _currentIndex = 0;
  Future<void> setIndex(index) async{
    _currentIndex = index;
    notifyListeners();
  }

  int getIndex() => _currentIndex;
}

final ZoomDrawerController zoomDrawerController = ZoomDrawerController();