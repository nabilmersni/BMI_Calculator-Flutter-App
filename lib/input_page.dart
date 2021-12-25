import 'package:flutter/material.dart';
import './components/card_container.dart';

const Color cardContainerColor = Color(0xff1D1F33);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                    child: CardContainer(bgColor: cardContainerColor),
                  ),
                  Expanded(
                    child: CardContainer(bgColor: cardContainerColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardContainer(bgColor: cardContainerColor),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(bgColor: cardContainerColor),
                  ),
                  Expanded(
                    child: CardContainer(bgColor: cardContainerColor),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
