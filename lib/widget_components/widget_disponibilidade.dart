import 'package:flutter/material.dart';
import 'package:teste_tecnico/models/suites.dart';

class WidgetDisponibilidade extends StatefulWidget {
  final Suites quartos;
  const WidgetDisponibilidade({super.key, required this.quartos});

  @override
  State<WidgetDisponibilidade> createState() => _WidgetDisponibilidadeState();
}

class _WidgetDisponibilidadeState extends State<WidgetDisponibilidade> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 10, left: 10),
      child: Text(
        "Disponivel: ${widget.quartos.disponivel}",
        style: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
