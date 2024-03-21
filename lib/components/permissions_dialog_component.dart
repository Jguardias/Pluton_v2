import 'package:flutter/material.dart';
import 'package:pluton_v2/components/my_toast_component.dart';
import 'package:pluton_v2/services/firebase_services.dart';

Future<void> dialogPermissions(BuildContext context, String title) {
  bool isLoading = true;

  void updateLoading(bool value) {
    isLoading = value;
  }

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        title: const Text(
          "¿Quieres eliminar este registro?",
          style: TextStyle(fontSize: 17.0),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
                backgroundColor: Colors.red),
            child:
                const Text('Cancelar', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
                backgroundColor: Colors.blue.shade800),
            child: const Text('Aceptar', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              if (isLoading) {
                updateLoading(false);
                await deleteElement(title).then((_) {
                  showMyToast(context, "Registro eliminado", Colors.green);
                  updateLoading(true);
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                });
              }
            },
          ),
        ],
      );
    },
  );
}
