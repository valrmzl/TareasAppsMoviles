import 'package:flutter/material.dart';
import 'package:calculadora_imc/my_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green), 
      ),
      home: HomePage(),
    );
  }
}

