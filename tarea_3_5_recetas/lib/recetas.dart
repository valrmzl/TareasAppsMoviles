import 'package:flutter/material.dart';
import 'package:tarea_3_5_recetas/detalle_receta.dart';

class RecipeCard extends StatelessWidget {
  final Map<String, dynamic> receta;

  

  RecipeCard({required this.receta});

 

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetalleReceta(
                receta: receta
              ),
            ),
          );
        },
        child: Stack(
          children: [
            // Imagen de la receta con bordes redondeados
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                "assets/images/comida-${receta["id"]}.jpg",
                fit: BoxFit.cover,
                height: 215,
                width: double.infinity,
              ),
            ),
            // Recuadro negro en la parte inferior
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black.withOpacity(0.6),
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Nombre de la receta centrado
                    Text(
                      receta["title"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    // Espacio entre elementos
                    SizedBox(height: 4.0),

                    // Contenido centrado
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Centrar contenido horizontalmente
                      children: [
                        Icon(
                          Icons.access_time, // Icono de reloj
                          size: 14, // Tamaño del icono
                          color: Colors.white, // Color del icono
                        ),
                        SizedBox(width: 4), // Espacio entre el icono y el texto
                        Text(
                          receta["duration"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 16.0), // Espacio entre campos
                        Icon(
                          Icons.shopping_bag, // Icono de bolsa de compras
                          size: 14,
                          color: Colors.white,
                        ),
                        SizedBox(width: 4),
                        Text(
                          receta["complexity"],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 16.0), // Espacio entre campos
                        Icon(
                          Icons.attach_money, // Icono de signo de dólar
                          size: 14,
                          color: Colors.white,
                        ),
                        SizedBox(width: 4),
                        Text(
                          receta["affordability"],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
