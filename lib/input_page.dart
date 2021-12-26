import 'package:flutter/material.dart';
import './components/card_container.dart';
import './components/gender_btn_content.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
  notSelected,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.notSelected;
  double currentHeight = 180;

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
                    child: CardContainer(
                      onPressed: () {
                        setState(() {
                          gender = Gender.male;
                        });
                      },
                      bgColor: gender == Gender.male
                          ? kActiveCardContainerColor
                          : kInactiveCardContainerColor,
                      cardChild: GenderBTNContent(
                        svgPath: 'images/male.svg',
                        text: 'MALE',
                        iconColor: gender == Gender.male
                            ? kActiveIconColor
                            : kInactiveIconColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      onPressed: () {
                        setState(() {
                          gender = Gender.female;
                        });
                      },
                      bgColor: gender == Gender.female
                          ? kActiveCardContainerColor
                          : kInactiveCardContainerColor,
                      cardChild: GenderBTNContent(
                        svgPath: 'images/female.svg',
                        text: 'FEMALE',
                        iconColor: gender == Gender.female
                            ? kActiveIconColor
                            : kInactiveIconColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardContainer(
                bgColor: kActiveCardContainerColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          currentHeight.round().toString(),
                          style: kBoldTextStyle,
                        ),
                        const Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: currentHeight,
                      min: 50,
                      max: 300,
                      activeColor: Color(0xffEB1555),
                      inactiveColor: Color(0xff8D8E98),
                      // thumbColor: Color(0xffEB1555),
                      // label: currentHeight.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          currentHeight = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(
                      bgColor: kActiveCardContainerColor,
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      bgColor: kActiveCardContainerColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
