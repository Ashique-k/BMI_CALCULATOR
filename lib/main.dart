// lib/main.dart

import 'package:bmi_calculator/screens/bmi_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMIScreen(),
    );
  }
}
