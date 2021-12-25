import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  CardContainer({required this.bgColor, this.cardChild});

  final Color bgColor;
  final cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
    );
  }
}
