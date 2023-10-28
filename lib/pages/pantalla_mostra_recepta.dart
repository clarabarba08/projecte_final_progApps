import 'package:flutter/material.dart';
import 'package:tasca_3/classe_recepta.dart';

class PantallaMostraRecepta extends StatelessWidget {
  static const String route = '/recepta';

  @override
  Widget build(BuildContext context) {
    final Recepta recepta =
        ModalRoute.of(context)!.settings.arguments as Recepta;

    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            RecipeBanner(recepta!),
            RecipeOverview(recepta),
            Ingredients(recepta),
            Preparation(recepta),
          ],
        ),
      ),
    );
  }
}

class RecipeBanner extends StatefulWidget {
  final Recepta recepta;
  const RecipeBanner(this.recepta);

  @override
  State<RecipeBanner> createState() => _RecipeBannerState();
}

class _RecipeBannerState extends State<RecipeBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.recepta.imatge),
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.recepta.nom,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.recepta.liked = !widget.recepta.liked;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: widget.recepta.liked ? Colors.red : Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
              rating(valoracio: widget.recepta.valoracio),
            ],
          ),
        ),
      ),
    );
  }
}

class rating extends StatelessWidget {
  final int valoracio;

  const rating({
    super.key,
    required this.valoracio,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < valoracio; i++)
          Icon(Icons.star, color: Colors.orange),
        for (int i = 0; i < 5 - valoracio; i++)
          Icon(Icons.star, color: Colors.white)
      ],
    );
  }
}

class RecipeOverview extends StatelessWidget {
  final Recepta recepta;
  const RecipeOverview(this.recepta);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 16, right: 12, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.schedule,
                color: Colors.orange,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "${recepta.tempsPreparacio} MIN",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.lunch_dining,
                color: Colors.orange,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "${recepta.persones} Servings",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.restaurant,
                color: Colors.orange,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "${recepta.calories} Cals",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Ingredients extends StatelessWidget {
  final Recepta recepta;
  const Ingredients(this.recepta);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "INGREDIENTS",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          for (int i = 0; i < recepta.ingredients.length; i++)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                recepta.ingredients[i],
                style: TextStyle(fontSize: 20),
              ),
            )
        ],
      ),
    );
  }
}

class Preparation extends StatelessWidget {
  final Recepta recepta;
  const Preparation(this.recepta);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PREPARACIÓ",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          for (int i = 0; i < recepta.pasAPas.length; i++)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                recepta.pasAPas[i],
                style: TextStyle(fontSize: 20),
              ),
            )
        ],
      ),
    );
  }
}
