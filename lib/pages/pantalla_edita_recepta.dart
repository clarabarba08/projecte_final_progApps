import 'package:flutter/material.dart';

class PantallaEditaRecepta extends StatefulWidget {
  static const String route = '/edita_recepta';
  const PantallaEditaRecepta({super.key});
  @override
  State<PantallaEditaRecepta> createState() => _PantallaEditaReceptaState();
}

class _PantallaEditaReceptaState extends State<PantallaEditaRecepta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edita recepta",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.grey[800],
      body: const Text("Edita recepta"),
    );
  }
}
