import 'package:create_widget/styled_text.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

final randomizer = Random();

class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}




class _DiceRollerState extends State<DiceRoller>{
  var currentDiceRoll =2;

  int counter =0;

  void rollDice(){
    currentDiceRoll = randomizer.nextInt(6)+1;
    setState(() { });
  }


  void rollDiceEffect() async {
    Timer.periodic(const Duration(milliseconds: 80), (timer) {
      counter++;
      setState(() {
        currentDiceRoll = randomizer.nextInt(6)+1;
      });

      if (counter >= 13){
        timer.cancel();
        setState(() {
          counter=1;
        });
      }

     });
  }



  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/dice-$currentDiceRoll.png',
        width: 200,),


        TextButton(
          onPressed: rollDiceEffect,
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(10.0),
            foregroundColor: Colors.black,
            textStyle: const TextStyle(
              fontSize: 30,
            )
          ),
          child: const StyledText("Gira el dado") //Text('Gira el dado'),

        ),
      ],

    );
  }
}