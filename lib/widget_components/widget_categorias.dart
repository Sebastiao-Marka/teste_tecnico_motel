import 'package:flutter/material.dart';
import 'package:teste_tecnico/models/suites.dart';

class WidgetCategorias extends StatefulWidget {
  final Suites quartos;
  const WidgetCategorias({super.key, required this.quartos});

  @override
  State<WidgetCategorias> createState() => _WidgetCategoriasState();
}

class _WidgetCategoriasState extends State<WidgetCategorias> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.46,
          height: MediaQuery.of(context).size.height * 0.13,
          margin: const EdgeInsets.only(top: 10, left: 10),
          child: ListView.builder(
            itemCount: widget.quartos.categorias.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                "${widget.quartos.categorias[index]['nome']}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
      ],
    );
  }
}
