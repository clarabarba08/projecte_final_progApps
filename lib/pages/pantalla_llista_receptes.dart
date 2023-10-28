import 'package:flutter/material.dart';
import 'package:tasca_3/classe_recepta.dart';

Map<String, dynamic> receptaJSON = {
  "nom": "Espaguetis a la carbonara",
  "tempsPreparacio": 30,
  "persones": 4,
  "calories": 600,
  "valoracio": 3,
  "ingredients": [
    "200g espaguetis",
    "2 ous",
    "100g bacó",
    "50g formatge parmesà",
    "Pebre negre al gust"
  ],
  "pasAPas": [
    "1. Bullir els espaguetis",
    "2. Saltejar el bacó",
    "3. Batre l'ou amb el formatge",
    "4. Afegir els espaguetis a la paella",
    "5. Afegir la barreja d'ou i formatge",
    "6. Remenar fins que s'espessi",
    "7. Salpebrar al gust"
  ],
  "imatge":
      "https://e00-xlk-cooking-elmundo.uecdn.es/files/article_main_microformat_4_3/uploads/2023/02/28/63fe8443a52bc.jpeg",
};

class PantallaLlistaReceptes extends StatelessWidget {
  static const String route = '/';
  const PantallaLlistaReceptes({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Llista de receptes",
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.grey[900],
        ),
        body: const Center(
          child: LlistaReceptes(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.orange[900],
        ));
  }
}

class LlistaReceptes extends StatefulWidget {
  const LlistaReceptes({
    super.key,
  });

  @override
  State<LlistaReceptes> createState() => _LlistaReceptesState();
}

class _LlistaReceptesState extends State<LlistaReceptes> {
  List<Recepta> receptes = [];
  List likes = [];
  @override
  void initState() {
    super.initState();
    receptes = List.generate(10, (index) => Recepta(receptaJSON));
  }

  void valorarRecepta(int index, int valoracio) {
    setState(() {
      receptes[index].valoracio = valoracio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: itemBuilder,
      itemCount: receptes.length,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(receptes[index].imatge),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black, Colors.transparent],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      receptes[index].nom,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Rating(
                          valoracio: receptes[index].valoracio,
                        ),
                        onTap: () {
                          RatingDialog(context,
                              (valoracio) => valorarRecepta(index, valoracio));
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            receptes[index].liked = !receptes[index].liked;
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          color:
                              receptes[index].liked ? Colors.red : Colors.white,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        print("clicat");
      },
    );
  }
}

class Rating extends StatelessWidget {
  final int valoracio;

  const Rating({
    super.key,
    required this.valoracio,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < valoracio; i++)
          const Icon(Icons.star, color: Colors.orange, size: 17),
        for (int i = 0; i < 5 - valoracio; i++)
          const Icon(Icons.star, color: Colors.white, size: 17)
      ],
    );
  }
}

Future<void> RatingDialog(
  BuildContext context,
  Function valoraRecepta,
) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text(
          'Valorar recepta',
          style: TextStyle(color: Colors.white),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 5; i++)
              GestureDetector(
                child: Icon(Icons.star, color: Colors.white, size: 40),
                onTap: () {
                  valoraRecepta(i + 1);
                  Navigator.of(context).pop(i + 1);
                },
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel·lar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
