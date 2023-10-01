import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_class/Providers/counter_provider.dart';

class SumaResta extends StatefulWidget {
  const SumaResta({super.key});

  @override
  State<SumaResta> createState() => _SumaRestaState();
}

class _SumaRestaState extends State<SumaResta> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suma y Resta"),
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
                context.read<CounterProvider>().increment();
              },
              child: const Text('+'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().decremnt();
              },
              child: const Text('-'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().reset();
              },
              child: const Text('reset'),
            )
              ],

            ),
           
          ],
        ),
      ),
    );
  }
}
