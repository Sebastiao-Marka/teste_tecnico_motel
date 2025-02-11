import 'package:flutter/material.dart';
import 'package:teste_tecnico/models/suites.dart';

import 'widget_categorias.dart';
import 'widget_disponibilidade.dart';
import 'widget_image.dart';
import 'widget_item.dart';
import 'widget_precos.dart';
import 'widget_quantidade.dart';

class ItensQuarto extends StatefulWidget {
  final Suites quartos;
  const ItensQuarto({super.key, required this.quartos});

  @override
  State<ItensQuarto> createState() => _ItensQuartoState();
}

class _ItensQuartoState extends State<ItensQuarto> {
  bool exibeDetalhes = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.98,
      height: exibeDetalhes
          ? MediaQuery.of(context).size.height * 1.04
          : MediaQuery.of(context).size.height * 0.3,
      child: Column(children: [
        WidgetImage(quartos: widget.quartos),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  widget.quartos.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              exibeDetalhes
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          exibeDetalhes = false;
                        });
                      },
                      icon: Icon(
                        Icons.arrow_drop_up,
                        size: 30,
                      ))
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          exibeDetalhes = true;
                        });
                      },
                      icon: Icon(
                        Icons.arrow_drop_down,
                        size: 30,
                      ))
            ],
          ),
        ),
        exibeDetalhes
            ? Row(
                children: [
                  WidgetQuantidade(quartos: widget.quartos),
                ],
              )
            : SizedBox.shrink(),
        exibeDetalhes
            ? WidgetDisponibilidade(quartos: widget.quartos)
            : SizedBox.shrink(),
        exibeDetalhes
            ? Row(
                children: [
                  WidgetCategorias(quartos: widget.quartos),
                  WidgetPrecos(quartos: widget.quartos),
                ],
              )
            : SizedBox.shrink(),
        exibeDetalhes ? WidgetItem(quartos: widget.quartos) : SizedBox.shrink(),
      ]),
    );
  }
}
