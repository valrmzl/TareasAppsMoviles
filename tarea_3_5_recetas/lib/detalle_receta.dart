

import 'package:flutter/material.dart';

class DetalleReceta extends StatefulWidget {
  final Map<String, dynamic> receta;

  DetalleReceta({required this.receta});

  @override
  _DetalleRecetaState createState() => _DetalleRecetaState();
}

class _DetalleRecetaState extends State<DetalleReceta> {
  bool esFavorito = false;

  void _toggleFavorito() {
    setState(() {
      esFavorito = !esFavorito;
    });

    final mensaje = esFavorito ? 'Agregado a favoritos' : 'Eliminado de favoritos';
    
    // Mostrar Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receta["title"]),
        actions: [
          IconButton(
            icon: Icon(
              esFavorito ? Icons.star : Icons.star_border,
              color: esFavorito ? Colors.yellow : Colors.white,
            ),
            onPressed: _toggleFavorito,
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 165, 133, 97),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Imagen de la receta
              Image.asset(
                "assets/images/comida-${widget.receta["id"]}.jpg",
                height: 370, // Ajusta la altura de la imagen según tus necesidades
                width: double.infinity, // Ocupa todo el ancho disponible
                fit: BoxFit.cover, // Ajusta la imagen al tamaño del contenedor
              ),
      
              // Espaciador vertical
              SizedBox(height: 16.0),
      
              // Título de Ingredientes
              Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      
              // Lista de ingredientes
              Column(
                children: (widget.receta["ingredients"] as List<String>).map((ingrediente) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      ingrediente,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  );
                }).toList(),
              ),
      
              // Espaciador vertical
              SizedBox(height: 16.0),
      
              // Título de Pasos
              Text(
                "Steps",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      
              // Lista de pasos
              Column(
                children: (widget.receta["steps"] as List<String>).map((paso) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      paso,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
