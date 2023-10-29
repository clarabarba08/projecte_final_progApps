import 'package:flutter/material.dart';
import 'package:tasca_3/pages/pantalla_edita_recepta.dart';
import 'package:tasca_3/pages/pantalla_llista_receptes.dart';
import 'package:tasca_3/pages/pantalla_mostra_recepta.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "App de receptes",
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        routes: {
          PantallaLlistaReceptes.route: (context) =>
              const PantallaLlistaReceptes(),
          PantallaMostraRecepta.route: (context) => PantallaMostraRecepta(),
          PantallaEditaRecepta.route: (context) => const PantallaEditaRecepta(),
        });
  }
}
