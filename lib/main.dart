import 'package:flutter/material.dart';
import 'package:teste_tecnico/page/page_home.dart';

import 'utils/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Motel Guids',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 20, 1, 54)),
          useMaterial3: true,
        ),
        home: PageHome(),
        routes: {
          AppRouter().Home: (context) => PageHome(),
          AppRouter().Mensagens: (context) => PageHome(),
        });
  }
}
