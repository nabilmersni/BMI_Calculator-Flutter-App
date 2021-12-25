import 'package:flutter/material.dart';
import './components/card_container.dart';
import './components/gender_btn_content.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color activeCardContainerColor = Color(0xff1D1F33);
const Color inactiveCardContainerColor = Color(0xff111328);

const Color activeIconColor = Colors.white;
const Color inactiveIconColor = Color(0xff8D8E98);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleContainerColor = inactiveCardContainerColor;
  Color maleIconColor = inactiveIconColor;

  Color femaleContainerColor = inactiveCardContainerColor;
  Color femaleIconColor = inactiveIconColor;

  String gender = '';

  void updateColor(gender) {
    if (gender == 'male') {
      maleContainerColor = activeCardContainerColor;
      maleIconColor = activeIconColor;

      femaleContainerColor = inactiveCardContainerColor;
      femaleIconColor = inactiveIconColor;
    } else if (gender == 'female') {
      femaleContainerColor = activeCardContainerColor;
      femaleIconColor = activeIconColor;

      maleContainerColor = inactiveCardContainerColor;
      maleIconColor = inactiveIconColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('BMI CALCULATOR'),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = 'male';
                          updateColor(gender);
                        });
                      },
                      child: CardContainer(
                        bgColor: maleContainerColor,
                        cardChild: GenderBTNContent(
                          svgPath: 'images/male.svg',
                          text: 'MALE',
                          iconColor: maleIconColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = 'female';
                          updateColor(gender);
                        });
                      },
                      child: CardContainer(
                        bgColor: femaleContainerColor,
                        cardChild: GenderBTNContent(
                          svgPath: 'images/female.svg',
                          text: 'FEMALE',
                          iconColor: femaleIconColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardContainer(bgColor: activeCardContainerColor),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(bgColor: activeCardContainerColor),
                  ),
                  Expanded(
                    child: CardContainer(bgColor: activeCardContainerColor),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
