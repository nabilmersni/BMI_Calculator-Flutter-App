import 'package:flutter/material.dart';
import 'components/card_container.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  final bmiResult;
  const ResultsPage({Key? key, this.bmiResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Result',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardContainer(
              bgColor: kActiveCardContainerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Normal',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiResult.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Your BMI result is quite low, you should eat more!',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, 'homePage');
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 5),
              height: 48,
              width: double.infinity,
              color: Color(0xffEB1555),
              child: const Center(
                child: Text(
                  'RE-CALCULATE BMI',
                  style: TextStyle(fontSize: 21),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
