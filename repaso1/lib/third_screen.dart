import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ruta 3"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: [
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "(◕‿◕)");
                  // Lógica para el primer botón
                },
                child: const Text("(◕‿◕)"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "(•ᴗ•❁)ψ");
                },
                child: const Text("(•ᴗ•❁)ψ "),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "¯\_(ツ)_/¯");
                },
                child: const Text("¯\_(ツ)_/¯"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
