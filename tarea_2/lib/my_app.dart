import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  }

class _MyAppState extends State<MyApp>{
  int count=0;


  void cambiarColor(){
    
  }


  void aumentarLikes(){
    setState(() {
      count++;
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
          child: Column(children: [
            Image.network("https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg"),
            ListTile(
              title: Text("El ITESO, Universidad Jesuita de Guadalajara", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("San Pedro Tlaquepaque, Jal."),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: aumentarLikes,
                    iconSize: 40,
                    icon: Icon(Icons.thumb_up),
                    
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:22),
                    child: Text('$count'),
                  )
                ],
              ) ,
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      iconSize: 48,
                      onPressed: (){},
                      icon: Icon(Icons.mail),
                    ),
                    Text("Correo")
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      iconSize: 48,
                      onPressed: (){},
                      icon: Icon(Icons.phone),
                    ),
                    Text("Llamada")
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      iconSize: 48,
                      onPressed: (){},
                      icon: Icon(Icons.directions),
                    ),
                    Text("Ruta")
                  ],
                ),
                
              ],
            ),
            SizedBox(height: 64,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('''El ITESO, Universidad Jesuita de Guadalajara  es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita que integra a ocho universidades en México. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros. A continuación se presenta la historia de la institución en periodos de décadas'''
              , textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.bold)),
            )
          ],),
        )
      ),
    );
  }


}

