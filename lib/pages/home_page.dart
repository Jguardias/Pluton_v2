import 'package:flutter/material.dart';
import 'package:pluton_v2/providers/income_provider.dart';
import 'package:pluton_v2/utils/percentage_function.dart';
import 'package:provider/provider.dart';
import '../components/my_card.dart';
import 'package:pluton_v2/pages/form_income.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List<String> listValue =
        filledStorage(context.watch<IncomeProvider>().income);

    return ListView(
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
              Container(
                child: const Text("Pluton_v2",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: "RobotoMedium")),
              ),
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
                  Text(
                      context.watch<IncomeProvider>().income.toString() == "0"
                          ? " ---"
                          : context.watch<IncomeProvider>().income.toString(),
                      style: TextStyle(
                          color: Colors.indigo.shade50,
                          fontSize: 35,
                          fontFamily: "RobotoBlack")),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text("NETO PASTORAL Y DESCUENTOS",
                    style: TextStyle(
                      color: Color.fromARGB(255, 136, 136, 136),
                      fontFamily: "RobotoBlack",
                    )),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    const SizedBox(height: 10),
                    MyCard(
                      title: "ASOPROVIPAZ",
                      percentage: "6.0%",
                      value: listValue[1],
                    ),
                    MyCard(
                      title: "APORTE VOLUNTARIO",
                      percentage: "1.0%",
                      value: listValue[3],
                    ),
                    MyCard(
                      title: "APORTE CONGREGACIONAL",
                      percentage: "2.0%",
                      value: listValue[2],
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
                  ],
                ),
              ),
              SizedBox(
                width:
                    double.infinity, // Ocupar el ancho completo de la pantalla
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue.shade800)),
                    onPressed: () {
                      print(listValue);
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
    );
  }
}
