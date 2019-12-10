import 'package:flutter/foundation.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int _page = 0;
  int get page => _page;
  set page(int val) {
    _page = val;
    notifyListeners();
  }
}
