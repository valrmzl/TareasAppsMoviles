import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  ItemActividad({super.key,required this.imagen,
      required this.dia,
      required this.titulo});

   String imagen;
   int dia;
   String titulo;



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            child: Image.asset("$imagen", fit: BoxFit.fill),
          ),
          Text("Day $dia", style: TextStyle(fontSize: 11)),
          Text("$titulo"),
        ],
      ),
    );
  }
}
/*
import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/arrozales.jpg',
    'assets/images/cascadas.jpg',
    'assets/images/isla.jpg',
    'assets/images/templo.jpg',
  ];

  final List<String> touristSpots = [
    "Bali mountains",
    "Beaches of Bali",
    "Bali Temples",
    "Bali Cuisine",
    "Bali Adventure",
  ];

  ItemActividad({super.key});

  @override
  Widget build(BuildContext context) {
    int i = 0; // Indice de la imagen seleccionada

    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (i; i < 1; i++)
            Container(
              height: 120,
              width: 120,
              child: Image.asset(
                imagePaths[i],
                fit: BoxFit.cover,
              ),
            ),
          Text("Day ${i + 1}", style: TextStyle(fontSize: 11)),
          Text(touristSpots[i]), // Muestra el texto correspondiente a la imagen seleccionada
        ],
      ),
    );
  }
}

*/



/////////////////////////////////////////////
/*
class ItemActividad extends StatelessWidget {
  ItemActividad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            color: Colors.purple,
          ),
          Text("Day 1", style: TextStyle(fontSize: 11)),
          Text("Bali mountains"),
        ],
      ),
    );
  }
}

*/