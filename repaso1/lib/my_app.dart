import 'package:flutter/material.dart';
import 'package:repaso1/second_screen.dart';
import 'package:repaso1/third_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mensajeDesdePagina3="";
  String numeroDesdePagina2=""; 
  String palabra=""; // Variable para almacenar el mensaje de la página 3

  // Método para actualizar la variable con el valor de la página 3

   void actualizarNumeroDesdePagina2(String numero) {
    setState(() {
      numeroDesdePagina2 = numero;
    });
  }

  void actualizarMensajeDesdePagina3(String mensaje) {
    setState(() {
      mensajeDesdePagina3 = mensaje;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarea 1"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("BIENVENIDOS",
          style: GoogleFonts.pacifico(
            fontSize: 40,
            color: Colors.grey
            
          )),
          Image.asset('assets/images/imagen.png'),
          SizedBox(height: 40),
          Text(
            "Seleccione la accion a realizar:",
           style: GoogleFonts.cabin(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black
            
          ),
          ),
          SizedBox(height: 60), // Espacio vertical entre el texto y los botones
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             ElevatedButton(
              onPressed: () async {
                // Almacena una referencia al contexto de la página actual
                BuildContext page2Context = context;

              String textoIngresado = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  TextEditingController _textController = TextEditingController();

                return AlertDialog(
                  title: Text("Ingrese datos"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Ingrese palabra:"),
                      TextField(

                        controller: _textController,
                      
                      ),
                      
                    ],
          )   ,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () async {
                  //palabra = _textController.text;
                
                  final resultado = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(),
                    ),
                  );

                  if (resultado != null) {
                    //palabra = resultado;
                    actualizarNumeroDesdePagina2(resultado);
                  }
                  palabra = _textController.text;
                  Navigator.of(context).pop(null);
                  //palabra = _textController.text;
                },
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );

    if (textoIngresado != null && textoIngresado.isNotEmpty) {
      // El usuario ingresó texto, puedes usarlo como desees
      print("Texto ingresado: $textoIngresado");

      // Usar el contexto de la "Página 2" para la navegación
      final resultado = await Navigator.push(
        page2Context, // Usar el contexto de la "Página 2"
        MaterialPageRoute(
          builder: (context) => SecondScreen(),
        ),
      );
    }
  },
  child: Text("Pagina 2 "),
),


              ElevatedButton(
                onPressed: () async {
                  final resultado = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdScreen(),
                    ),
                  );

                  if (resultado != null) {
                    actualizarMensajeDesdePagina3(resultado);
                  }
                },
                child: Text("Pagina 3"),
              ),
            ],
          ),
          SizedBox(height: 50),
          Text("Pg. 2 => $palabra$numeroDesdePagina2"),
          SizedBox(height: 50),
          Text("Pg. 3 => $mensajeDesdePagina3"), // Mostrar el mensaje de la página 3 aquí
        ],
      ),
    );
  }
}
