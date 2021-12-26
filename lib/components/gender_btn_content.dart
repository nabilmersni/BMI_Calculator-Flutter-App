import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GenderBTNContent extends StatelessWidget {
  GenderBTNContent(
      {required this.svgPath, required this.text, required this.iconColor});

  final String svgPath;
  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgPath,
          color: iconColor,
          width: 65,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: iconColor,
          ),
        ),
      ],
    );
  }
}
