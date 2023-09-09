import 'package:flutter/material.dart';
import 'package:tarea_3/info_lugar.dart';
import 'package:tarea_3/item_actividad.dart';

class HomePage extends StatelessWidget {
   HomePage({
    Key? key,
  }) : super(key: key);


   // 5 actividades
  final List<Map<String, String>> mapaActividades = [
    {"imagen": "assets/images/arrozales.jpg", "titulo": "Arrozales Bali"},
    {"imagen": "assets/images/bosques.jpg", "titulo": "Bosques Bali"},
    {"imagen": "assets/images/cascadas.jpg", "titulo": "Cascadas Bali"},
    {"imagen": "assets/images/isla.jpg", "titulo": "Isla Bali"},
    {"imagen": "assets/images/templo.jpg", "titulo": "Templo Bali"},
    {"imagen": "assets/images/arrozales.jpg", "titulo": "Arrozales Bali"},
    {"imagen": "assets/images/bosques.jpg", "titulo": "Bosques Bali"},
    {"imagen": "assets/images/cascadas.jpg", "titulo": "Cascadas Bali"},
    {"imagen": "assets/images/isla.jpg", "titulo": "Isla Bali"},
    {"imagen": "assets/images/templo.jpg", "titulo": "Templo Bali"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
             Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), // Ajusta el valor para cambiar el radio de las esquinas
                  child: Image.asset(
                    'assets/images/bali.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 64,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(
                            imagen: mapaActividades[index]["imagen"]!,
                            dia: index + 1,
                            titulo: mapaActividades[index]["titulo"]!,
                          );
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        // Agregar el SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Reservación en proceso :D'), // Mensaje que deseas mostrar en el SnackBar
                            duration: Duration(seconds: 2), // Duración del SnackBar
                          ),
                        );
                      },
                      child: Text("Start booking",
                      style: TextStyle(
                        color: Colors.white
                      )),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}