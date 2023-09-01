

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  bool mailPressed = false;
  bool callPressed = false;
  bool rutaPressed = false;

  Color iconoColor1 = Colors.black;
  Color iconoColor2 = Colors.black;
  Color iconoColor3 = Colors.black;
  


    void cambiarColor(int icono, BuildContext context, String nombreIcono) {
    setState(() {
      final snackBar = SnackBar(content: Text('Icono $nombreIcono clickeado'), duration: Duration(seconds: 2));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      if (icono == 1) {
        iconoColor1 = (iconoColor1 == Colors.black) ? Colors.indigo : Colors.black;
      } else if (icono == 2) {
        iconoColor2 = (iconoColor2 == Colors.black) ? Colors.indigo : Colors.black;
      } else if (icono == 3) {
        iconoColor3 = (iconoColor3 == Colors.black) ? Colors.indigo : Colors.black;
      } 
    });
  }




  void aumentarLikes() {
    setState(() {
      count++;
    });
  }

  void restarLikes() {
    setState(() {
      if (count <= 0) {
        count = 0;
      } else {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App ITESO',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App ITESO'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network("https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg"),
              ListTile(
                title: Text("El ITESO, Universidad Jesuita de Guadalajara", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Text("San Pedro Tlaquepaque, Jal.", style: TextStyle(fontSize: 15)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: restarLikes,
                      iconSize: 40,
                      icon: Icon(Icons.thumb_down),
                    ),
                    IconButton(
                      onPressed: aumentarLikes,
                      iconSize: 40,
                      icon: Icon(Icons.thumb_up),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 22),
                      child: Text('$count'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:50.0,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     Builder(
                          builder: (BuildContext builderContext) {
                            return GestureDetector(
                              onTap: () => cambiarColor(1, builderContext, "mail"),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.mail,
                                    size: 55,
                                    color: iconoColor1,
                                  ),
                                  Text("Correo", style: TextStyle(fontSize: 20))
                                ],
                                
                              ),
                              
                              
                              
                            );
                            
                          },
                          
                        ),
                        Builder(
                          builder: (BuildContext builderContext) {
                            return GestureDetector(
                              onTap: () => cambiarColor(2, builderContext, "llamada"),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.call,
                                    size: 55,
                                    color: iconoColor2,
                                  ),
                                  Text("Llamada", style: TextStyle(fontSize: 20))
                                ],
                              ),
                            );
                          },
                        ),
                        Builder(
                          builder: (BuildContext builderContext) {
                            return GestureDetector(
                              onTap: () => cambiarColor(3, builderContext, "ruta"),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.assistant_direction_rounded,
                                    size: 55,
                                    color: iconoColor3,
                                  ),
                                  Text("Ruta", style: TextStyle(fontSize: 20),)
                                ],
                              ),
                            );
                          },
                        ),
                    
                  ],
                ),
              ),
              SizedBox(height: 64),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'El ITESO, Universidad Jesuita de Guadalajara es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita que integra a ocho universidades en México. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros. A continuación se presenta la historia de la institución en periodos de décadas',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

