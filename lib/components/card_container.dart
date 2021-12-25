import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Color bgColor;

  CardContainer({required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
    );
  }
}
