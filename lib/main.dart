import 'package:flutter/material.dart';
import 'package:tasca_3/pages/pantalla_llista_receptes.dart';
import 'package:tasca_3/pages/pantalla_mostra_recepta.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "App de receptes",
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        routes: {
          PantallaLlistaReceptes.route: (context) => PantallaLlistaReceptes(),
          PantallaMostraRecepta.route: (context) => PantallaMostraRecepta(),
        });
  }
}
