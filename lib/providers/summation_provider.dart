import 'package:flutter/material.dart';

class SummationProvider with ChangeNotifier {
  final Map<String, double> _summation = {
    "ASOPROVIPAZ": 0.0,
    "APORTE VOLUNTARIO": 0.0,
    "APORTE CONGREGACIONAL": 0.0,
    "DIEZMO DE DIEZMO": 0.0,
    "SUMA DE APORTES": 0.0,
    "NETO PASTORAL": 0.0,
    "INGRESO TOTAL": 0.0,
  };

  Map<String, double> get summation => _summation;

void updateSummationFromDB(Map<String, double> data) {
  summation.forEach((key, value) {
    summation[key] = (summation[key] ?? 0.0) +( data[key] ?? 0.0);
  });

  notifyListeners();
}

void updateSummationReload() {
  summation.forEach((key, value) {
    summation[key] =  0.0;
  });

  notifyListeners();
}

}
