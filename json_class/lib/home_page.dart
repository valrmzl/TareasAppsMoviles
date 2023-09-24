import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_class/crypto_list.dart';
import 'package:json_class/data/constants.dart';


void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>{

  List<dynamic> criptos = [];

  @override

  //inicializador
  void initState(){
    criptos = jsonDecode(CRYPTO_EXCHANGES);
    super.initState();

  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Crypto App")
      ),
      body: CryptoList(criptos: criptos),
    );
  }
}