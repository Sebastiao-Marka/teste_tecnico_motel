import 'package:flutter/material.dart';
import 'package:teste_tecnico/models/suites.dart';

class WidgetImage extends StatefulWidget {
  final Suites quartos;
  const WidgetImage({super.key, required this.quartos});

  @override
  State<WidgetImage> createState() => _WidgetImageState();
}

class _WidgetImageState extends State<WidgetImage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.98,
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.quartos.fotos.length,
        itemBuilder: (BuildContext context, int index) {
          final fotos = widget.quartos.fotos[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              fotos,
              width: MediaQuery.of(context).size.width * 0.96,
              height: MediaQuery.of(context).size.height * 0.2,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
