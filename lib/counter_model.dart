import 'package:flutter/cupertino.dart';

class CounterModel with ChangeNotifier {
  int _counter = 0;
  
  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  int get currentCount => _counter;
}
