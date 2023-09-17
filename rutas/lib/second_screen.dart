import 'package:flutter/material.dart';
import 'package:rutas/my_app.dart';
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.lista});

  final Lista lista;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: const Text("Ruta 2"),
    ),
    body: Padding(
      padding: const EdgeInsets.all(18),
      child: Text(lista.contenido))


   );
  }
}


/*
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: const Text("Ruta 2"),
    ),
    body: Center(
      child: ElevatedButton(
        onPressed: (){
          Navigator.pop(context); //destrute la pantalla
        },
        child: const Text("Regresar a 1")
      ),

    ),


   );
  }
}
*/