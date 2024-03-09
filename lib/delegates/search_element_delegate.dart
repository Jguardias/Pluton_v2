import 'package:flutter/material.dart';

class SearchElementDelegate extends SearchDelegate {
  List<String> searchElement = ["apple", "pin", "cow", "banana", "bluberry"];

  @override
  String get searchFieldLabel => "Buscar elemento";

  @override
    TextStyle? get searchFieldStyle => const TextStyle(
    fontSize: 17.0, fontFamily: "RobotoMedium" 
  );

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
    final result =
        searchElement.where((element) => element.contains(query)).toList();
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: const Icon(Icons.search),
          trailing: const Icon(Icons.arrow_outward_rounded),
          title: Text(result[index]),
          tileColor: Colors.white,
        );
      },
    );
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
