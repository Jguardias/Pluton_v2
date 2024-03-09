import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyCard extends StatefulWidget {
  final String title;
  final double value;
  final String percentage;

  const MyCard(
      {super.key,
      required this.title,
      required this.value,
      required this.percentage});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final formattedNumber = NumberFormat('###,###.## ');
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blueAccent.shade200,
            child: Text(
              widget.percentage,
              style: const TextStyle(color: Colors.white, fontSize: 10.0),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 70, 70, 70),
                      fontFamily: "RobotoBlack",
                      fontSize: 12.0),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: widget.title == "NETO PASTORAL" || widget.title == "INGRESO TOTAL"
                                ? Colors.green
                                : const Color.fromARGB(255, 255, 105, 105),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0))),
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          widget.title == "NETO PASTORAL"|| widget.title == "INGRESO TOTAL"
                              ? "INGRESO"
                              : "EGRESO",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: "RobotoBlack",
                              fontSize: 9.0),
                        ),
                      ),
                      Text("\$ ${formattedNumber.format(widget.value)}",
                          style: TextStyle(
                              color: widget.title == "NETO PASTORAL"|| widget.title == "INGRESO TOTAL"
                                  ? Colors.green
                                  : const Color.fromARGB(255, 251, 62, 62),
                              fontFamily: "RobotoBlack",
                              fontSize: 13.0)),
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
