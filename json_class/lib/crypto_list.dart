import 'package:flutter/material.dart';
import 'package:json_class/home_page.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({Key? key, required this.criptos}); // Corrección aquí

  final List criptos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: criptos.length,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) { 
        return ListTile(
          leading:Image.network("${criptos[index]["image"]}"),
          title: Text("${criptos[index]["name"]}"),
          subtitle: Text('${criptos[index]["country"]}\n${criptos[index]["year_established"]}'),
          trailing: CircleAvatar(
            backgroundColor: Colors.black,
            child: Text('${criptos[index]["trust_score"]}')),
        );
      },
    );
  } 
} 
