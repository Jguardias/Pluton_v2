import 'package:flutter/material.dart';

class IncomeProvider with ChangeNotifier {
  double _income = 0;

 double get income => _income;

  void updateIncome( double value) {
    _income = value;
    notifyListeners();
  }
}
