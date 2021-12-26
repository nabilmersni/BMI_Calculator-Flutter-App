import 'package:flutter/material.dart';
import './components/card_container.dart';
import './components/gender_btn_content.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants.dart';
import 'dart:math';

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
  int currentWeight = 70;
  int currentAge = 20;

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
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xffEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayColor: Color(0x29EB1555),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xff8D8E98),
                      ),
                      child: Slider(
                        value: currentHeight,
                        min: 50,
                        max: 300,

                        // label: currentHeight.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            currentHeight = value;
                          });
                        },
                      ),
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
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            currentWeight.toString(),
                            style: kBoldTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                svgPath: 'images/minus.svg',
                                onPressed: () {
                                  setState(() {
                                    currentWeight > 0 ? currentWeight-- : null;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 17,
                              ),
                              RoundIconButton(
                                svgPath: 'images/plus.svg',
                                onPressed: () {
                                  setState(() {
                                    currentWeight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      bgColor: kActiveCardContainerColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            currentAge.toString(),
                            style: kBoldTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                svgPath: 'images/minus.svg',
                                onPressed: () {
                                  setState(() {
                                    currentAge > 0 ? currentAge-- : null;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 17,
                              ),
                              RoundIconButton(
                                svgPath: 'images/plus.svg',
                                onPressed: () {
                                  setState(() {
                                    currentAge++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                //currentWeight / pow(currentHeight * 0.01, 2)
              },
              child: Container(
                margin: EdgeInsets.only(top: 5),
                height: 65,
                width: double.infinity,
                color: Color(0xffEB1555),
                child: const Center(
                  child: Text(
                    'CALCULATE BMI',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({this.svgPath, this.onPressed});

  final svgPath;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: SvgPicture.asset(
        svgPath,
        color: Colors.white,
        width: 20,
      ),
      onPressed: onPressed,
      elevation: 2,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xff373645),
      shape: CircleBorder(),
    );
  }
}
