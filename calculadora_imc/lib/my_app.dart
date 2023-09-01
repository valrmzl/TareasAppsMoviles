import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({ super.key});

  @override
  State <HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(

    );
  }

}


/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
*/