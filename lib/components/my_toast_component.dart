import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void showMyToast(BuildContext context, String title,Color color) {
  Fluttertoast.showToast(
    msg: title,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: color, // Personaliza el color del fondo del toast
    textColor: Colors.white, // Personaliza el color del texto del toast
    fontSize: 16.0,

  );
}
