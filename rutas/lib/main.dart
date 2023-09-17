import 'package:flutter/material.dart';
import 'package:rutas/my_app.dart';

void main() => runApp(MaterialApp(

  title : 'Rutas',
  home: MyApp( porhacer: List.generate(10, (i)=> Lista("Elemento $i", "Descripcion $i")))
));

