import 'package:flutter/material.dart';
import 'package:provider_class/Screens/multiplica.dart';
import 'package:provider_class/Screens/suma_resta.dart';

import 'Screens/prime.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage =0;
  final List<Widget> _pages = [
    const SumaResta(),
    const Multiplica(),
    const Prime(),
    

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        
        body: _pages[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: (int index){
            setState(() {
              selectedPage = index;
            });
          }, items: [
            BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Suma y resta'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Multiplica'),
            BottomNavigationBarItem(icon: Icon(Icons.heat_pump), label: 'Primo'),
          ],

        ),
      ),
    );
  }
}