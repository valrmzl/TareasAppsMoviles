import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color iconoColor1 = Colors.black;
  Color iconoColor2 = Colors.black;
  Color iconoColor3 = Colors.black;
  Color iconoColor4 = Colors.black;

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
      } else if (icono == 4) {
        iconoColor4 = (iconoColor4 == Colors.black) ? Colors.indigo : Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Mc Flutter"),
        ),
        body: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.account_circle, size: 48),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Flutter McFlutter",
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Experienced App Developer",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("123 Main Street"),
                        ],
                      ),
                      Column(
                        children: [
                          Text("(415-555-0198)"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Builder(
                        builder: (BuildContext builderContext) {
                          return GestureDetector(
                            onTap: () => cambiarColor(1, builderContext, "persona"),
                            child: Icon(
                              Icons.accessibility,
                              size: 32,
                              color: iconoColor1,
                            ),
                          );
                        },
                      ),
                      Builder(
                        builder: (BuildContext builderContext) {
                          return GestureDetector(
                            onTap: () => cambiarColor(2, builderContext, "reloj"),
                            child: Icon(
                              Icons.timer,
                              size: 32,
                              color: iconoColor2,
                            ),
                          );
                        },
                      ),
                      Builder(
                        builder: (BuildContext builderContext) {
                          return GestureDetector(
                            onTap: () => cambiarColor(3, builderContext,"android"),
                            child: Icon(
                              Icons.phone_android,
                              size: 32,
                              color: iconoColor3,
                            ),
                          );
                        },
                      ),
                      Builder(
                        builder: (BuildContext builderContext) {
                          return GestureDetector(
                            onTap: () => cambiarColor(4, builderContext, "iphone"),
                            child: Icon(
                              Icons.phone_iphone,
                              size: 32,
                              color: iconoColor4,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
