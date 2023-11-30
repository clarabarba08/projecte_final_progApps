import 'package:flutter/material.dart';
import 'package:tasca_3/models/usuari.dart';
// import 'package:tasca_3/models/grup.dart';
import 'package:tasca_3/pages/pantalla_afegeix_grup.dart';

class pantallagrups extends StatelessWidget {
  const pantallagrups({super.key});

  @override
  Widget build(BuildContext context) {
    return UserGrid(
        usuari: Usuari(
            'Nom Usuari',
            'https://cdn-icons-png.flaticon.com/512/4792/4792929.png',
            ['Família 1', 'Família 2', 'Amics uni', 'Amics cole']));
  }
}

class UserGrid extends StatefulWidget {
  final Usuari usuari;

  UserGrid({required this.usuari});

  @override
  State<UserGrid> createState() => _UserGridState();
}

class _UserGridState extends State<UserGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Número de columnas
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: widget.usuari.grups.length,
          itemBuilder: (context, index) {
            return GridItem(userName: widget.usuari.grups[index]);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PantallaAfegeixGrup()))
                .then((value) => setState(() {
                      if (value is String) {
                        widget.usuari.grups.add(value);
                      }
                    }));
          },
          backgroundColor: Colors.orange[900],
          child: const Icon(Icons.add, color: Colors.white),
        ));
  }
}

class GridItem extends StatelessWidget {
  final String userName;

  GridItem({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(
          userName,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
