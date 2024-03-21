import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pluton_v2/components/my_list_tile_component.dart';
import 'package:pluton_v2/services/firebase_services.dart';

class SearchElementDelegate extends SearchDelegate {
  List<dynamic> searchElement = ["Ej: Enero semana 1 2024"]; // Declaración de la variable

  @override
  String get searchFieldLabel => "Buscar elemento";

  @override
  TextStyle? get searchFieldStyle =>
      const TextStyle(fontSize: 17.0, fontFamily: "RobotoMedium");

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: searchDocumentByTitle(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data!.exists) {
              var documentData = snapshot.data!.data() as Map<String, dynamic>;
              return ListView(
                children: [
                  FadeIn(
                    child: MyListTile(
                      title: documentData["TITLE"],
                      date: documentData["DATE"],
                      aporteCongregacional:
                          documentData["APORTE CONGREGACIONAL"],
                      aporteVoluntario: documentData["APORTE VOLUNTARIO"],
                      asoprovipaz: documentData["ASOPROVIPAZ"],
                      diezmodediezmo: documentData["DIEZMO DE DIEZMO"],
                      netopastoral: documentData["NETO PASTORAL"],
                      sumadeaportes: documentData["SUMA DE APORTES"],
                      ingresoTotal: documentData["INGRESO TOTAL"],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                  child: Text(
                "No se encontraron registros",
                style: TextStyle(color: Colors.grey.shade600),
              ));
            }
          } else {
            return Center(
              child: CircularProgressIndicator(color: Colors.blue.shade800),
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: searchElement.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          hoverColor: Colors.amber,
          leading: const Icon(Icons.refresh_rounded),
          title: Text(searchElement[index]),
          tileColor: Colors.white,
        );
      },
    );
  }
}
