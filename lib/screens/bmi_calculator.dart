// lib/logic/bmi_calculator.dart

class BMICalculator {
  double calculateBMI(double height, double weight) {
    if (height <= 0 || weight <= 0) {
      throw ArgumentError("Height and weight must be greater than zero.");
    }
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }
}
