import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_class/Providers/counter_provider.dart';

class Prime extends StatefulWidget {
  const Prime({super.key});

  @override
  State<Prime> createState() => _PrimeState();
}

class _PrimeState extends State<Prime> {
  bool isPrime(int number) {
    if (number <= 1) return false;
    if (number <= 3) return true;

    if (number % 2 == 0 || number % 3 == 0) return false;

    for (int i = 5; i * i <= number; i += 6) {
      if (number % i == 0 || number % (i + 2) == 0) {
        return false;
      }
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final int counter = context.watch<CounterProvider>().counter;
    final bool isNumberPrime = isPrime(counter);

    // Define colores para el fondo basados en si es primo o no
    final Color backgroundColor = isNumberPrime ? Colors.green : Colors.blue;

    return Scaffold(
      appBar: AppBar(
        title: Text("¿Es primo?"),
      ),
      body: Container(
        color: backgroundColor, // Cambia el color de fondo del Scaffold
        child: Center(
          child: Column(
            children: [
              Text(
                counter.toString(),
                style: const TextStyle(fontSize: 40),
              ),
              Text(
                isNumberPrime ? "Primo" : "No Primo",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white, // Cambia el color del texto
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
