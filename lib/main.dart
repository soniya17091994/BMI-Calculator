import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(BMI_Calculator_App());
}

class BMI_Calculator_App extends StatefulWidget {
  const BMI_Calculator_App({Key? key}) : super(key: key);

  @override
  State<BMI_Calculator_App> createState() => _BMI_Calculator_AppState();
}

class _BMI_Calculator_AppState extends State<BMI_Calculator_App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
