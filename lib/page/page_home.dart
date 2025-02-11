import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste_tecnico/models/suites.dart';
import 'package:teste_tecnico/utils/router.dart';

import '../models/marca.dart';
import '../models/notification.dart';
import '../widget_components/bagdge.dart';
import '../widget_components/itens_quarto.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => PageHomeState();
}

class PageHomeState extends State<PageHome> {
  /* motel */
  Future<Motel?> getMotel() async {
    Motel? motel;
    final dynamic body = await fetchData();
    setState(() {
      motel = Motel.motel(body);
    });

    return motel;
  }

  /*mensagem*/
  Future<Notifications> getMensagem() async {
    final dynamic body = await fetchData();
    final Notifications notificacao = Notifications.mensagem(body["mensagem"]);
    return notificacao;
  }

  /* suites */
  Future<List<Suites>> getSuites() async {
    final dynamic body = await fetchData();
    List<Suites> quartos = [];
    for (var i = 0; body["data"]["moteis"][0]["suites"].length > i; i++) {
      final suite = body["data"]["moteis"][0]["suites"];
      final Suites suites = Suites.suites(suite[i]);

      quartos.add(suites);
    }
    return quartos;
  }

  /*acesso*/
  // bool sucesso = body["sucesso"];

  Future<dynamic> fetchData() async {
    final url = Uri.parse('https://www.jsonkeeper.com/b/1IXK');
    final response = await http.get(url);
    final dynamic body = jsonDecode(utf8.decode(response.bodyBytes));
    return body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 34, 92),
          title: FutureBuilder(
              future: getMotel(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Motel? motel = snapshot.data;
                  return Stack(
                    children: [
                      ClipOval(
                        child: Image.network(motel!.logo,
                            width: 50, height: 50, fit: BoxFit.cover),
                      ),
                      Center(
                        child: Column(
                          spacing: 10,
                          children: [
                            Text(
                              motel.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              motel.endereco,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
          actions: [
            SizedBox(
                width: 70,
                height: 70,
                child: StreamBuilder(
                    stream: Stream.fromFuture(getMensagem()),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Notifications? notificacao = snapshot.data;
                        return Stack(children: [
                          notificacao!.quantidade == 0
                              ? Badgee(
                                  value: "",
                                  child: Icon(
                                    Icons.notifications_active,
                                    size: 40,
                                  ))
                              : IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        AppRouter().Mensagens,
                                        arguments: notificacao);
                                  },
                                  icon: Badgee(
                                      value: notificacao.quantidade.toString(),
                                      child: Icon(
                                        Icons.notifications_active,
                                        size: 40,
                                        color: Colors.white,
                                      )),
                                )
                        ]);
                      } else {
                        return SizedBox.shrink();
                      }
                    })),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.895,
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
                child: FutureBuilder(
                    future: getSuites(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data!;
                        return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final quartos = data[index];
                            return ItensQuarto(quartos: quartos);
                          },
                        );
                      } else {
                        return const Text('No data');
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
