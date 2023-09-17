import 'package:flutter/material.dart';

const startAlingment = Alignment.topLeft;
const endAlignment = Alignment.bottomLeft;

class GradianContainer extends StatelessWidget{
  const GradianContainer (this.color1, this.color2,{super.key});

  const GradianContainer.blue({super.key}):
  color1=const Color.fromARGB(255, 74, 157, 195),
  color2= Colors.white;

  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient (
          colors: [color1, color2],
          begin: startAlingment,
          end : endAlignment
          
          )
      ),
      child: const Center(
        //child: DiceRoller(),
      )
    );
  }
}