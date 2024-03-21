import 'package:flutter/material.dart';
import 'package:pluton_v2/components/my_dialog_component.dart';
import 'package:pluton_v2/providers/income_provider.dart';
import 'package:pluton_v2/utils/percentage_function.dart';
import 'package:provider/provider.dart';
import 'package:pluton_v2/components/my_card_component.dart';
import 'package:pluton_v2/pages/form_income.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List<double> listValue =
        filledStorage(context.watch<IncomeProvider>().income);
    final formattedNumber = NumberFormat('###,###.## ');
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade800,
                  Colors.indigo.shade700,
                  Colors.blue.shade600
                ],
                // stops: [0.0, 0.5, 1.0],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                const Text("Pluton_v2",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: "RobotoMedium")),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Lottie.asset("assets/animations/Loading.json"),
                    Text(r"$ ",
                        style: TextStyle(
                            color: Colors.indigo.shade50,
                            fontSize: 19,
                            fontFamily: "RobotoBlack")),
                    GestureDetector(
                      onTap: (){
                        context.read<IncomeProvider>().updateIncome(0);
                      },
                      child: Text(
                          context.watch<IncomeProvider>().income == 0
                              ? " ---"
                              : formattedNumber
                                  .format(context.watch<IncomeProvider>().income),
                          style: TextStyle(
                              color: Colors.indigo.shade50,
                              fontSize: 35,
                              fontFamily: "RobotoBlack")),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(color: Colors.white, width: 2.0),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FormIncome()))
                  },
                  child: const Text("Generar nuevo ingreso",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: "RobotoMedium")),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            padding: const EdgeInsets.all(20),
            color: Color.fromARGB(255, 241, 241, 241),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text("NETO PASTORAL Y DESCUENTOS",
                      style: TextStyle(
                        color: Color.fromARGB(255, 136, 136, 136),
                        fontFamily: "RobotoBlack",
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        MyCard(
                          title: "ASOPROVIPAZ",
                          percentage: "6.0%",
                          value: listValue[2],
                        ),
                        MyCard(
                          title: "APORTE VOLUNTARIO",
                          percentage: "1.0%",
                          value: listValue[3],
                        ),
                        MyCard(
                          title: "APORTE CONGREGACIONAL",
                          percentage: "2.0%",
                          value: listValue[1],
                        ),
                        MyCard(
                          title: "DIEZMO DE DIEZMO",
                          percentage: "21.0%",
                          value: listValue[0],
                        ),
                        MyCard(
                          title: "SUMA DE APORTES",
                          percentage: "30.7%",
                          value: listValue[4],
                        ),
                        MyCard(
                          title: "NETO PASTORAL",
                          percentage: "69.3%",
                          value: listValue[5],
                        ),
                        MyCard(
                          title: "INGRESO TOTAL",
                          percentage: "100%",
                          value: listValue[6],
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
                              Colors.blue.shade800)),
                      onPressed: () {
                        dialogBuilder(context, listValue);
                      },
                      child: const Text(
                        "Guardar",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
