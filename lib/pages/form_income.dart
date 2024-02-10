import 'package:flutter/material.dart';
import 'package:pluton_v2/providers/income_provider.dart';
import 'package:provider/provider.dart';


class FormIncome extends StatefulWidget {
  const FormIncome({super.key});

  @override
  State<FormIncome> createState() => _FormIncomeState();
}

class _FormIncomeState extends State<FormIncome> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade800,
          leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Aquí cambiamos el color
          onPressed: () => Navigator.of(context).pop(),
         ),
          title: const Text(
            "Formulario de Ingreso",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                  "Por favor, ingresa el monto total de los ingresos para que podamos realizar los cálculos correspondientes.",
                  style: TextStyle(fontFamily: " RobotoLight")),
              const SizedBox(height: 10),
              SizedBox(
                  child: TextField(
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45)),
                  border: const OutlineInputBorder(),
                  labelStyle: const TextStyle(
                      color: Colors.black45, fontFamily: "RobotoMedium"),
                  labelText: "Ingresar valor",
                  suffixIcon: GestureDetector(
                    onTap: () {_textController.clear();},
                    child: const Icon(Icons.clear, size: 20.0),
                  ),
                ),
                controller: _textController,
                cursorColor: Colors.black45,
                keyboardType: TextInputType.number,
              )),
              const SizedBox(height: 10.0),
              SizedBox(
                width:
                    double.infinity, // Ocupar el ancho completo de la pantalla
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue.shade800)),
                    onPressed: () {
                      double income = double.tryParse(_textController.text) ?? 0;
                      context.read<IncomeProvider>().updateIncome(income);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Enviar",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ));
  }
}
