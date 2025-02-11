import 'package:flutter/material.dart';
import 'package:teste_tecnico/models/suites.dart';

class WidgetPrecos extends StatefulWidget {
  final Suites quartos;
  const WidgetPrecos({super.key, required this.quartos});

  @override
  State<WidgetPrecos> createState() => _WidgetPrecosState();
}

class _WidgetPrecosState extends State<WidgetPrecos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(66, 243, 33, 33),
            Color.fromARGB(61, 170, 3, 3),
            Color.fromARGB(61, 51, 4, 1),
          ],
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.1,
      margin: const EdgeInsets.only(top: 10, right: 0),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(top: 5, right: 0),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Periodo:  ${widget.quartos.periodos[index]["tempoFormatado"]} ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Text(widget.quartos.periodos[index]["valor"].toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}
