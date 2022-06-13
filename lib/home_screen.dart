import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String gender1;
  var darkBlueColor = Color(0xff002640);
  var maleColor = Color(0xff033e66);
  var femaleColor = Color(0xff033e66);
  var maleIconColor = Colors.white;
  var femaleIconColor = Colors.white;
  int height1 = 120;
  int age1 = 20;
  int weight1 = 45;

  addSubAge(bool Ageadd) {
    if (Ageadd) {
      setState(() {
        age1++;
      });
    } else {
      setState(() {
        age1--;
      });
    }
  }

  addSubWeight(bool Weightadd) {
    if (Weightadd) {
      setState(() {
        weight1++;
      });
    } else {
      setState(() {
        weight1--;
      });
    }
  }

  void selectGender(bool gender) {
    if (gender) {
      setState(() {
        maleColor = blueColor;
        femaleColor = selectColor;
        maleIconColor = Colors.white70;
        gender1 = 'male';
      });
    } else {
      setState(() {
        femaleColor = blueColor;
        maleColor = selectColor;
        femaleIconColor = Colors.white70;
        gender1 = 'female';
      });
    }
  }

  calculateBMI() {
    var heightInMeters = height1 / 100;
    var bmi = weight1 / (heightInMeters * heightInMeters);
    print(bmi.round());
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultScreen(bmiResult: bmi.round())));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: darkBlueColor,
      appBar: AppBar(
        backgroundColor: darkBlueColor,
        title: Text("BMI Calculator"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      color: maleColor,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.male,
                          size: height / 8,
                          color: Colors.white,
                        ),
                        Text(
                          "Male",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    height: 150,
                    width: width * 0.45,
                  ),
                  onTap: () {
                    print("male");
                    selectGender(true);
                  },
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      color: femaleColor,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.female,
                          size: height / 8,
                          color: Colors.white,
                        ),
                        Text(
                          "Female",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    height: 150,
                    width: width * 0.45,
                  ),
                  onTap: () {
                    print("female");
                    selectGender(false);
                  },
                ),
              ],
            ),
            Container(
              height: 150,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                color: blueColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${height1}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "cm",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white70),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.pink,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.white70,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 10.0,
                      ),
                      overlayColor: Colors.pinkAccent.withOpacity(0.3),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      value: height1.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double valueChanged) {
                        setState(() {
                          height1 = valueChanged.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    color: blueColor,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Age",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "${age1}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectColor,
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            onTap: () {
                              addSubAge(false);
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectColor,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            onTap: () {
                              addSubAge(true);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  height: 150,
                  width: width * 0.45,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    color: blueColor,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Weight",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "${weight1}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectColor,
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            onTap: () {
                              addSubWeight(false);
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectColor,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            onTap: () {
                              addSubWeight(true);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  height: 150,
                  width: width * 0.45,
                ),
              ],
            ),
            GestureDetector(
              child: Container(
                height: 70,
                width: width,
                color: Colors.pink,
                child: Center(
                  child: Text(
                    "Calculate BMI",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onTap: () {
                calculateBMI();
              },
            ),
          ]),
    );
  }
}
