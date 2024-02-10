import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final String title;
  final String value;
  final String percentage;

   const MyCard({super.key, required this.title, required this.value, required this.percentage});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Color.fromARGB(255, 203, 203, 203),
        width: 1.0,
      ))),
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: <Widget>[
          Text(widget.title,
              style: const TextStyle(
                  color: Color.fromARGB(255, 70, 70, 70),
                  fontFamily: "RobotoBlack",
                  fontSize: 12.0
                  ),),
          const SizedBox(width: 10.0),
          Container(
            decoration:
                 BoxDecoration(
                  color: Colors.orange.shade600,
                  borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
            padding: const EdgeInsets.all(4),
            alignment: Alignment.center,
            child:  Text(
              widget.percentage,
              style: const TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ),
          const Spacer(),
          Text("\$ ${widget.value}",
              style:  TextStyle(
                  color: widget.title == "NETO PASTORAL" ?  Colors.green : const Color.fromARGB(255, 251, 62, 62),
                  fontFamily: "RobotoBlack")
                  ),
        ],
      ),
    );
  }
}
