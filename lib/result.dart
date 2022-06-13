import 'constant.dart';
import 'dart:math';
import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final int bmiResult;

  const ResultScreen({Key? key, required this.bmiResult}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var bmicolor = Colors.white;
  var bmiText = 'Normal';
  var imagepath = 'normal';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Hello");
    updateUI();
  }

  void updateUI() {
    var bmi = widget.bmiResult;
    if (bmi < 18) {
      setState(() {
        bmiText = 'Underweight';
        bmicolor = Colors.blueAccent;
        imagepath = 'underweight';
      });
    } 
    else if (bmi >= 18 && bmi <= 25) {
      setState(() {
        bmiText = 'Normal';
        bmicolor = Colors.green;
        imagepath = 'normal';
      });
    } 
    else if (bmi > 26 && bmi <= 30) {
      setState(() {
        bmiText = 'Overweight';
        bmicolor = Colors.yellow;
        imagepath = 'overweight';
      });
    } 
    else if (bmi >= 31 && bmi <= 35) {
      setState(() {
        bmiText = 'Obese';
        bmicolor = Colors.orange;
        imagepath = 'obese';
      });
    } 
    else if (bmi >= 36) {
      setState(() {
        bmiText = "Extreme Obese";
        bmicolor = Colors.orange;
        imagepath = 'extreme';
      });
    }
  }

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: darkBlueColor,
      appBar: AppBar(
        backgroundColor: darkBlueColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Color(0xff033e66),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your BMI Value is",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Text(
                    "${widget.bmiResult}",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    bmiText,
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: bmicolor),
                  )
                ]),
          ),
          Image.asset(
            'images/${imagepath}.png',
            height: height * 0.5,
          ),
          GestureDetector(
            child: Container(
              height: 70,
              width: width,
              color: Colors.pink,
              child: Center(
                child: Text(
                  "Calculate BMI again",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
