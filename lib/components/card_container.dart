import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  CardContainer({required this.bgColor, this.cardChild, this.onPressed});

  final Color bgColor;
  final cardChild;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bgColor,
        ),
      ),
    );
  }
}
