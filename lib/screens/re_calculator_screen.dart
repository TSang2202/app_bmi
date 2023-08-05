import 'package:bmi_app/components/bottom_button.dart';
import 'package:bmi_app/components/reusable_card.dart';
import 'package:bmi_app/constants/app_colors.dart';
import 'package:bmi_app/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class ReCalculatorScreen extends StatelessWidget {
  const ReCalculatorScreen({super.key, required this.result});

  final double result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:  const Color(0xFF0A0E21),
        leading:   IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 30,
              ))
        ,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),

        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            flex: 1,
              child: Center(
                child: Text(
                  'Your Result',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 1.5
            ),
          ))),
          Expanded(
            flex: 5,
            child: ReusableCard(
              onPress: (){},
              colour: kActiveCardColour,
              cardChild:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'NORMAL',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Text(
                    result.toString(),
                    style: const TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You have normal body weight.',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        'Good job!',
                        style: kLabelTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: (){},
            buttonTitle: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
