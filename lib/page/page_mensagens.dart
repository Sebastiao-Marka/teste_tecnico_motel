import 'package:flutter/material.dart';

class Mensagens extends StatefulWidget {
  const Mensagens({super.key, Object? mensagen});

  @override
  State<Mensagens> createState() => _MensagensState();
}

class _MensagensState extends State<Mensagens> {
  @override
  Widget build(BuildContext context) {
    final List<String> mensagens =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensagens'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.green,
              Color.fromARGB(255, 51, 4, 1),
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: mensagens.length,
          itemBuilder: (BuildContext context, int index) {
            return Mensagens(mensagen: mensagens);
          },
        ),
      ),
    );
  }
}
