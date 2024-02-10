import 'package:flutter/material.dart';

class ListDbPage extends StatefulWidget {
  const ListDbPage({super.key});

  @override
  State<ListDbPage> createState() => _ListDbPageState();
}

class _ListDbPageState extends State<ListDbPage> {
  @override
  Widget build(BuildContext context) {
    return  const SizedBox(
      child: Center(
        child: Text("Fuera de servicio"),
      ),
    );
  }
}