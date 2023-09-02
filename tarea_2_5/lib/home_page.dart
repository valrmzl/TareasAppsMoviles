import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> options = ["Amazing 20%", "Good 18%", "Okay 15%"];
bool isSwitched = false;

class _HomePageState extends State<HomePage> {
  String currentOption = options[0];
  var alturaController = TextEditingController();
  var pesoController = TextEditingController();
  var totalController = TextEditingController();
  bool? genero;

  String propinaText = ""; // Nuevo estado para almacenar el texto de la propina

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Time'),
        
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
        child: ListView(
          children: [
            TextField(
              controller: totalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                icon: Icon(Icons.restaurant),
                labelText: "Cost of the service",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24,),
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.restaurant),
                Text(
                  "How was the service?",
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
),

            Column(
              children: [
                ListTile(
                  title: const Text("Amazing 20%"),
                  leading: Radio(
                    value: "Amazing 20%",
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text("Good 18%"),
                  leading: Radio(
                    value: "Good 18%",
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text("Okay 15%"),
                  leading: Radio(
                    value: "Okay 15%",
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.credit_card, size: 35,),
                    const SizedBox(width: 8),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto a la izquierda
                  children: [
                    Text("Round up tip", style: TextStyle(fontSize: 22)),
                  ],
                ),
                Spacer(), // Agrega un espacio flexible para mover el interruptor hacia la derecha
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(100.0),
              child: MaterialButton(
                child: const Text("CALCULATE"),
                onPressed: () {
                  double propina = showTip();
                  setState(() {
                    propinaText = "Tip Amount: \$$propina"; // Actualiza el texto de la propina
                  });
                },
                color: Colors.green,
                textColor: Colors.white,
              ),
            ),

            Text(
              "${propinaText}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

double showTip() {
  double total;
  double porcentaje;

  try {
    total = double.parse(totalController.text);
  } catch (e) {
    total = 0.0; // Manejar el caso cuando totalController.text no es un double válido
  }

  if (currentOption == "Amazing 20%") {
    porcentaje = 20.0;
  } else if (currentOption == "Good 18%") {
    porcentaje = 18.0;
  } else if (currentOption == "Okay 15%") {
    porcentaje = 15.0;
  } else {
    porcentaje = 0.0; // Valor por defecto si la opción no es válida
  }

  double propina = total * (porcentaje / 100);

  if (isSwitched) {
    propina = propina.ceilToDouble(); // Redondear al entero más cercano
  } else {
    propina = double.parse(propina.toStringAsFixed(2)); // Redondear a 2 decimales
  }

  return propina;
}



}
