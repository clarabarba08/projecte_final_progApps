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
  String pageName = "Nova recepta";

  void saveRecepta() {
    Recepta recepta = Recepta({
      "nom": controllers[0].text,
      "tempsPreparacio": int.parse(controllers[1].text),
      "persones": int.parse(controllers[2].text),
      "calories": int.parse(controllers[3].text),
      "valoracio": 0,
      "ingredients": controllers[4].text.split('\n'),
      "pasAPas": controllers[5].text.split('\n'),
      "imatge": controllers[6].text == ""
          ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkRKA2d4bynFWUL1-K4cCg4GYUNeBC7R9RtycIkKGf6jL8zhrUj9yROdOUH53yhNTjEgw&usqp=CAU"
          : controllers[6].text,
    });
    Navigator.pop(context, recepta);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args is Recepta) {
      final Recepta recepta = args as Recepta;
      controllers[0].text = recepta.nom;
      controllers[1].text = recepta.tempsPreparacio.toString();
      controllers[2].text = recepta.persones.toString();
      controllers[3].text = recepta.calories.toString();
      controllers[4].text = recepta.ingredients.join('\n');
      controllers[5].text = recepta.pasAPas.join('\n');
      controllers[6].text = recepta.imatge;
      pageName = "Edita recepta";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageName,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              saveRecepta();
            },
          ),
        ],
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
                onPressed: saveRecepta,
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
