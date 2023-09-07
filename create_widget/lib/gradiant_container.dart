import 'package:create_widget/dice_roller.dart';
import 'package:create_widget/styled_text.dart';
import 'package:flutter/material.dart';

const startAlingment = Alignment.bottomLeft;
const endAlignment = Alignment.bottomRight;

class GradianContainer extends StatelessWidget{
  const GradianContainer (this.color1, this.color2,{super.key});

  const GradianContainer.green({super.key}):
  color1=Colors.lightGreen,
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
        child: DiceRoller(),
      )
    );
  }
}