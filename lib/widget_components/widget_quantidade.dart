import 'package:flutter/material.dart';
import 'package:teste_tecnico/models/suites.dart';

class WidgetQuantidade extends StatefulWidget {
  final Suites quartos;
  const WidgetQuantidade({super.key, required this.quartos});

  @override
  State<WidgetQuantidade> createState() => _WidgetQuantidadeState();
}

class _WidgetQuantidadeState extends State<WidgetQuantidade> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 10, left: 10),
      child: Text(
        "Quantidade: ${widget.quartos.quantd}",
        style: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
