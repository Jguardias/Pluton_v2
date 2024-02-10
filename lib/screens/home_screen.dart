import 'package:flutter/material.dart';
import 'package:pluton_v2/pages/list_db_page.dart';
import 'package:pluton_v2/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Pluton_v2",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "RobotoMedium",
        ),
        home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _selectIndex = 0;

  final List<Widget> _pages = <Widget>[
    HomePage(),
    const ListDbPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800, // Ajusta al color deseado
        elevation: 0,
        toolbarHeight: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_sharp),
            label: "Crear",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist_rounded), label: "Lista")
        ],
        selectedItemColor: Colors.blue.shade800,
      ),
      body: _pages[_selectIndex],
    );
  }
}
