import 'package:flutter/material.dart';
import 'package:repaso1/graiant_container.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int numeroRandom=0;
  String numeroString="";

  void generateRandomNumber() {
  final random = Random();
  numeroRandom= random.nextInt(100) + 1;
  numeroString = numeroRandom.toString();
  setState(() { }); // Genera un número aleatorio entre 1 y 100.
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina 2"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const GradianContainer.blue(),
          Positioned(
            top: AppBar().preferredSize.height + 20,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Genere un número random",
                     style: GoogleFonts.cabin(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple
                    
                  ),      
                  ),
                  SizedBox(height: 20), // Espacio vertical entre el texto "Genere un número random" y "Hola"
                  Text(
                    ("$numeroString"),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  SizedBox(height: 20), // Espacio vertical entre el texto "Hola" y los botones
                  ElevatedButton(
                    onPressed: () {
                      generateRandomNumber();
                      // Lógica para el primer botón
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Fondo blanco
                      onPrimary: Colors.black, // Texto negro
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // Bordes cuadrados
                      ),
                    ),
                    child: Text("Generar"),
                  ),
                  SizedBox(height: 10), // Espacio vertical entre los botones
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, numeroString);
                      // Lógica para el segundo botón
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Fondo blanco
                      onPrimary: Colors.black, // Texto negro
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // Bordes cuadrados
                      ),
                    ),
                    child: Text("Guardar"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
