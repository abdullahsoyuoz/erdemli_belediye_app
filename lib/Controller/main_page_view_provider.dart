import 'package:flutter/material.dart';

class MainPageIndexer extends ChangeNotifier {
  int _currentIndex = 0;
  Future<void> setIndex(index) async{
    _currentIndex = index;
    notifyListeners();
  }

  int getIndex() => _currentIndex;
}
