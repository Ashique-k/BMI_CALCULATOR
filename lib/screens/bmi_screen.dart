// lib/ui/bmi_screen.dart

import 'package:flutter/material.dart';

import 'bmi_calculator.dart';


class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  BMICalculator _bmiCalculator = BMICalculator();
  double? _bmiResult;
  String? _bmiCategory;

  void _calculateBMI() {
    if (_formKey.currentState!.validate()) {
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);
      setState(() {
        _bmiResult = _bmiCalculator.calculateBMI(height, weight);
        _bmiCategory = _bmiCalculator.getBMICategory(_bmiResult!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(

                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontSize: 14),
                    labelText: 'Height (cm)',),

                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your height';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(

                controller: _weightController,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontSize: 14),
                    labelText: 'Weight (kg)'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your weight';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 80,
                child: ElevatedButton(
                  onPressed: _calculateBMI,
                  child: Text('Calculate BMI',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(5)
                    )
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (_bmiResult != null)
                Text(
                  'Your BMI: ${_bmiResult!.toStringAsFixed(2)}\nCategory: $_bmiCategory',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
