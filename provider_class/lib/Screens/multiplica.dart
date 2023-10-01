import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_class/Providers/counter_provider.dart';

class Multiplica extends StatefulWidget {
  const Multiplica({super.key});

  @override
  State<Multiplica> createState() => _MultiplicaState();
}

class _MultiplicaState extends State<Multiplica> {
  // Función para mostrar el SnackBar
  void mostrarSnackBar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multiplicación"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              context.watch<CounterProvider>().counter.toString(),
              style: const TextStyle(fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterProvider>().multiDos();
                    mostrarSnackBar('Se multiplicó x2');
                  },
                  child: const Text('x2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterProvider>().multiTres();
                    mostrarSnackBar('Se multiplicó x3');
                  },
                  child: const Text('x3'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterProvider>().multiCinco();
                    mostrarSnackBar('Se multiplicó x5');
                  },
                  child: const Text('x5'),
                ),
                // Agrega otros botones aquí si es necesario
              ],
            ),
          ],
        ),
      ),
    );
  }
}
