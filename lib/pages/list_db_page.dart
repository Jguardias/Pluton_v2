import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pluton_v2/components/my_list_tile_component.dart';
import 'package:pluton_v2/delegates/search_element_delegate.dart';
import 'package:pluton_v2/services/firebase_services.dart';

class ListDbPage extends StatefulWidget {
  const ListDbPage({super.key});

  @override
  State<ListDbPage> createState() => _ListDbPageState();
}

class _ListDbPageState extends State<ListDbPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: const Text(
          "Resumen de aportes",
          style: TextStyle(color: Colors.white, fontSize: 17.0),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchElementDelegate());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData && snapshot.data!.isNotEmpty){
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FadeIn(
                      delay: Duration(milliseconds: 100 * index),
                      child: MyListTile(
                        title: snapshot.data?[index]["TITLE"],
                        date: snapshot.data?[index]["DATE"],
                        aporteCongregacional: snapshot.data?[index]
                            ["APORTE CONGREGACIONAL"],
                        aporteVoluntario: snapshot.data?[index]
                            ["APORTE VOLUNTARIO"],
                        asoprovipaz: snapshot.data?[index]["ASOPROVIPAZ"],
                        diezmodediezmo: snapshot.data?[index]
                            ["DIEZMO DE DIEZMO"],
                        netopastoral: snapshot.data?[index]["NETO PASTORAL"],
                        sumadeaportes: snapshot.data?[index]["SUMA DE APORTES"],
                        ingresoTotal: snapshot.data?[index]["INGRESO TOTAL"],
                      ),
                    );
                  },
                );
              }else{
                return  Center(
                  child: Text("No se encontraron registros", style: TextStyle(color: Colors.grey.shade600),)
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(color: Colors.blue.shade800),
              );
            }
          }),
    );
  }
}
