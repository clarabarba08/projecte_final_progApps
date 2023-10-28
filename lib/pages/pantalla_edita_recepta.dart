import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tasca_3/classe_recepta.dart';

class PantallaEditaRecepta extends StatefulWidget {
  static const String route = '/edita_recepta';
  const PantallaEditaRecepta({super.key});
  @override
  State<PantallaEditaRecepta> createState() => _PantallaEditaReceptaState();
}

class _PantallaEditaReceptaState extends State<PantallaEditaRecepta> {
  List<TextEditingController> controllers = [
    for (var i = 0; i < 7; i++) TextEditingController()
  ];

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 8),
            editTextField("Nom de la recepta", 0, 1),
            const SizedBox(height: 16),
            editTextField("Temps de preparació (min)", 1, 1),
            const SizedBox(height: 16),
            editTextField("Racions", 2, 1),
            const SizedBox(height: 16),
            editTextField("Calories totals", 3, 1),
            const SizedBox(height: 16),
            editTextField("Ingredients", 4, 5),
            const SizedBox(height: 16),
            editTextField("Preparació", 5, 5),
            const SizedBox(height: 16),
            editTextField("Link imatge", 6, 1),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                child: const Text("Desa"),
                onPressed: () {
                  final Recepta recepta = Recepta({
                    "nom": controllers[0].text,
                    "tempsPreparacio": int.parse(controllers[1].text),
                    "persones": int.parse(controllers[2].text),
                    "calories": int.parse(controllers[3].text),
                    "valoracio": 0,
                    "ingredients": controllers[4].text.split('\n'),
                    "pasAPas": controllers[5].text.split('\n'),
                    "imatge": controllers[6].text,
                  });
                  Navigator.pop(context, recepta);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextField editTextField(String label, int controllerid, int minLines) {
    return TextField(
      controller: controllers[controllerid],
      keyboardType: TextInputType.multiline,
      minLines: minLines,
      maxLines: 40,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[400]),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
