import 'package:flutter/material.dart';
import 'input_page.dart';
import 'results_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0D22),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0A0D22),
        ),
        scaffoldBackgroundColor: Color(0xff0A0D22),
      ),
      // home: InputPage(),
      initialRoute: 'homePage',
      routes: {
        'homePage': (context) => const InputPage(),
        'resultPage': (context) => const ResultsPage(),
      },
    );
  }
}
