import 'package:flutter/material.dart';
import 'package:pluton_v2/components/my_toast_component.dart';
import 'package:pluton_v2/providers/income_provider.dart';
import 'package:provider/provider.dart';
import 'package:pluton_v2/services/firebase_services.dart';

Future<void> dialogBuilder(BuildContext context, List<double> data) {
  final textController = TextEditingController();
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
          "Nombre del registro:",
          style: TextStyle(fontSize: 17.0),
        ),
        content: TextField(
          decoration: InputDecoration(
            hintText: "Ej: Enero semana 1 del 2024",
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45)),
            border: const OutlineInputBorder(),
            suffixIcon: GestureDetector(
              onTap: () {
                textController.clear();
              },
              child: const Icon(Icons.clear, size: 20.0),
            ),
          ),
          controller: textController,
          cursorColor: Colors.black45,
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
              if (textController.text.isEmpty) {
                showMyToast(
                    context, "Debes ingresar un nombre de archivo", Colors.red);
              } else {
                if (data[0] != 0.0) {
                  context.read<IncomeProvider>().updateIncome(0);
                  if(isLoading){
                  updateLoading(false);
                  await addData(data, textController.text).then((_) {
                    showMyToast(context, "Datos almacenados", Colors.green);
                    updateLoading(true);
                  });
                  }
                } else {
                  showMyToast(context, "No hay aportes", Colors.red);
                }
              }

              if (!context.mounted) return;
              Navigator.of(context).pop();
            },
          ),
          
        ],
      );
    },
  );
}
