import 'package:flutter/material.dart';
import 'package:pluton_v2/components/my_card_component.dart';
import 'package:pluton_v2/components/my_dialog_component.dart';
import 'package:pluton_v2/providers/summation_provider.dart';
import 'package:provider/provider.dart';

class SummationPage extends StatefulWidget {
  const SummationPage({super.key});

  @override
  State<SummationPage> createState() => _SummationPageState();
}

class _SummationPageState extends State<SummationPage> {

  @override
  Widget build(BuildContext context) {
    final  summation = context.watch<SummationProvider>().summation;
    Map<String, double> newData = {
     "ASOPROVIPAZ": 100.0,
     "APORTE VOLUNTARIO": 50.0,
    "APORTE CONGREGACIONAL": 75.0,
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sumatoria de aportes semanales",
          style: TextStyle(color: Colors.white, fontSize: 17.0)),
        backgroundColor: Colors.blue.shade800,
      ),
      body:           Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            padding: const EdgeInsets.all(20),
            color: Color.fromARGB(255, 241, 241, 241),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text("APORTE MENSUAL",
                      style: TextStyle(
                        color: Color.fromARGB(255, 136, 136, 136),
                        fontFamily: "RobotoBlack",
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        MyCard(
                          title: "ASOPROVIPAZ",
                          percentage: "6.0%",
                          value: summation["ASOPROVIPAZ"] ?? 0.0,
                        ),
                        MyCard(
                          title: "APORTE VOLUNTARIO",
                          percentage: "1.0%",
                          value: summation["APORTE VOLUNTARIO"]?? 0.0 ,
                        ),
                        MyCard(
                          title: "APORTE CONGREGACIONAL",
                          percentage: "2.0%",
                          value: summation["APORTE CONGREGACIONAL"]?? 0.0 ,
                        ),
                        MyCard(
                          title: "DIEZMO DE DIEZMO",
                          percentage: "21.0%",
                          value: summation["DIEZMO DE DIEZMO"]?? 0.0 ,
                        ),
                        MyCard(
                          title: "SUMA DE APORTES",
                          percentage: "30.7%",
                          value: summation["SUMA DE APORTES"]?? 0.0,
                        ),
                        MyCard(
                          title: "NETO PASTORAL",
                          percentage: "69.3%",
                          value: summation["NETO PASTORAL"]?? 0.0,
                        ),
                        MyCard(
                          title: "INGRESO TOTAL",
                          percentage: "100%",
                          value: summation["INGRESO TOTAL"]?? 0.0,
                        ),
                      ],
                    ),
                  ),
                ),
                                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  width: double
                      .infinity, // Ocupar el ancho completo de la pantalla
                  height: 50,

                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red.shade400)),
                      onPressed: () {
                        context.read<SummationProvider>().updateSummationReload();
                        // dialogBuilder(context, listValue);
                      },
                      child: const Text(
                        "Reinicar aporte",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  width: double
                      .infinity, // Ocupar el ancho completo de la pantalla
                  height: 50,

                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blue.shade800)),
                      onPressed: () {
                        context.read<SummationProvider>().updateSummationFromDB(newData);
                        // dialogBuilder(context, listValue);
                      },
                      child: const Text(
                        "Guardar",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
    );
  }
}