import 'package:flutter/material.dart';
import 'package:pluton_v2/components/my_card.dart';
import 'package:pluton_v2/services/firebase_services.dart';

class MyListTile extends StatefulWidget {
  final String title;
  final String date;
  final double asoprovipaz;
  final double aporteVoluntario;
  final double aporteCongregacional;
  final double diezmodediezmo;
  final double sumadeaportes;
  final double netopastoral;
  final double ingresoTotal;
  const MyListTile(
      {super.key,
      required this.title,
      required this.date,
      required this.aporteCongregacional,
      required this.aporteVoluntario,
      required this.asoprovipaz,
      required this.diezmodediezmo,
      required this.netopastoral,
      required this.sumadeaportes,
      required this.ingresoTotal});

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green.shade600,
        child: const Text(
          "\$",
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        widget.title,
        style: const TextStyle(
            fontSize: 13.0,
            fontFamily: "RobotoBlack",
            color: Color.fromARGB(255, 70, 70, 70)),
      ),
      subtitle: Text(widget.date, style: const TextStyle(fontSize: 13.0)),
      trailing: const Icon(Icons.visibility),
      onTap: () async {
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return Center(
              child: AlertDialog(
                contentPadding: const EdgeInsets.all(25.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      widget.date,
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: Color.fromARGB(255, 136, 136, 136)),
                    )
                  ],
                ),
                content: SizedBox(
                  width: 500.0,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyCard(
                          title: "ASOPROVIPAZ",
                          percentage: "6.0%",
                          value: widget.asoprovipaz,
                        ),
                        MyCard(
                          title: "APORTE VOLUNTARIO",
                          percentage: "1.0%",
                          value: widget.aporteVoluntario,
                        ),
                        MyCard(
                          title: "APORTE CONGREGACIONAL",
                          percentage: "2.0%",
                          value: widget.aporteCongregacional,
                        ),
                        MyCard(
                          title: "DIEZMO DE DIEZMO",
                          percentage: "21.0%",
                          value: widget.diezmodediezmo,
                        ),
                        MyCard(
                          title: "SUMA DE APORTES",
                          percentage: "30.7%",
                          value: widget.sumadeaportes,
                        ),
                        MyCard(
                          title: "NETO PASTORAL",
                          percentage: "69.3%",
                          value: widget.netopastoral,
                        ),
                        MyCard(
                          title: "INGRESO TOTAL",
                          percentage: "100%",
                          value: widget.ingresoTotal,
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        backgroundColor: Colors.blue.shade800),
                    onPressed: () {
                      if (!context.mounted) return;
                      Navigator.pop(context); // Cierra el diálogo
                    },
                    child: const Text(
                      'Cerrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        backgroundColor: Colors.red),
                    onPressed: () async {
                      await deleteElement(widget.title);
                      if (!context.mounted) return;
                      Navigator.pop(context); // Cierra el diálogo
                    },
                    child: const Text(
                      'Eliminar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
