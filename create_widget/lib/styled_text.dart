import 'package:flutter/material.dart';




class StyledText extends StatelessWidget{
  const StyledText(this.text,{super.key});

  final String text;


  @override
  Widget build(BuildContext){
    return Text(
      text,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 30,
        fontWeight: FontWeight.bold


      )
    );
  }
}