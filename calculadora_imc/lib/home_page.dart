import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var alturaController = TextEditingController();
  var pesoController = TextEditingController();
  bool? genero;

  final String _mj = '''
Tabla del IMC para mujeres
Edad      IMC ideal 
16-17     19-24 
18-18       19-24   
19-24     19-24 
25-34     20-25 
35-44     21-26 
45-54     22-27 
55-64     23-28 
65-90     25-30
  ''';

  final String _hb= '''
Tabla del IMC para hombres
Edad      IMC ideal 
16-16       19-24   
17-17       20-25   
18-18       20-25   
19-24     21-26 
25-34     22-27 
35-54     23-38 
55-64     24-29 
65-90     25-30
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        actions: [
          IconButton(
            tooltip: "Borra todo",
            onPressed: (){
              alturaController.clear();
              pesoController.clear();
              genero =null;
              setState(() {});
            },
            icon: const  Icon(Icons.delete),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
        child: ListView(
          children: [
            const Text('Ingrese datos para calcular IMC'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: (){
                    genero = false;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.male,
                    color: genero == false ? Colors.indigo : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: (){
                    genero = true;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.female,
                    color: genero == true ? Colors.indigo : Colors.grey,
                  ),
                ) 
              ],
            ),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                icon:  Icon(Icons.height),
                labelText: "Ingrese altura",
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 24,),

            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                icon:  Icon(Icons.monitor_weight),
                labelText: "Ingrese peso",
                border: OutlineInputBorder()
              ),
            ),

            MaterialButton(
              child: const Text("Calcular"),
              onPressed: (){
                showImc();
              })
            
          ],
        ),
      ),
    );
  }

  double _imc() {
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text);
    return (peso / (altura*altura));
  }

  void showImc() {
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Tu IMC: ${_imc()}"),
          content: Text(genero == true ? _hb : _mj),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            )
          ],
        );
      }
    );
  }

  


}