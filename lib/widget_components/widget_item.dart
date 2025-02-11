import 'package:flutter/material.dart';
import 'package:teste_tecnico/models/suites.dart';

class WidgetItem extends StatefulWidget {
  final Suites quartos;
  const WidgetItem({super.key, required this.quartos});

  @override
  State<WidgetItem> createState() => _WidgetItemState();
}

class _WidgetItemState extends State<WidgetItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.5,
          margin: const EdgeInsets.only(top: 10, left: 10),
          child: ListView.builder(
            itemCount: widget.quartos.itens.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 100.0),
                child: Text(
                  widget.quartos.itens[index]['nome'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
