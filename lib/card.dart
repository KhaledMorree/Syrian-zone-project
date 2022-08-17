import 'package:flutter/material.dart';
import 'constants.dart';

class Reusable_card extends StatelessWidget {
  Reusable_card({ this.Colour, required this.CardChild});


  final Colour;
  final Widget CardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
