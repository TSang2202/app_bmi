import 'package:bmi_app/components/bottom_button.dart';
import 'package:bmi_app/components/icon_content.dart';
import 'package:bmi_app/components/reusable_card.dart';
import 'package:bmi_app/components/round_icon_button.dart';
import 'package:bmi_app/constants/app_colors.dart';
import 'package:bmi_app/constants/app_text_style.dart';
import 'package:bmi_app/screens/re_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender{
  male,
  female,
  none
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> with SingleTickerProviderStateMixin{

  Gender selectedGender = Gender.none;
  int _height = 180;
  int _weight = 60;
  int _age = 20;

  late AnimationController controller;

  @override
  void initState() {

    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      lowerBound: -1,
      upperBound: 0
    );
    controller.animateTo(
      0,
      curve: Curves.easeOut,
      duration: const Duration(seconds: 1)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'BMI CALCULATOR',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),

        ),
          actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.none;
                      _height = 180;
                      _age = 20;
                      _weight = 60;
                    });
                  },
                  icon: const Icon(
                    Icons.replay,
                    color: Colors.white,
                    size: 30,
                  ))
            ],
        backgroundColor:  const Color(0xFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (_, Widget? child){
                      return Transform.translate(
                          offset: Offset(controller.value * 200, 0),
                        child: child,
                      );
                    },
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male ? kActiveCardColour : kInActiveCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                        colour: selectedGender == Gender.male ? Colors.blue : Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (_, Widget? child){
                      return Transform.translate(
                        offset: Offset(controller.value * -200, 0),
                        child: child,
                      );
                    },
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female ? kActiveCardColour : kInActiveCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                        colour: selectedGender == Gender.female ? Colors.orange : Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: AnimatedBuilder(
            animation: controller,
            builder: (_, Widget? child){
              return Transform.translate(
                offset: Offset(controller.value * -400, 0),
                child: child,
              );
            },
            child: ReusableCard(
              onPress: (){},
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(
                      value: _height.toDouble(),
                      max: 220.0,
                      min: 120.0,
                      onChanged: (double value) {
                        setState(() {
                          _height = value.toInt().round();
                        });
                      },

                    ),
                  )
                ],
              ),
            ),
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: AnimatedBuilder(
                animation: controller,
                builder: (_, Widget? child){
                  return Transform.translate(
                    offset: Offset(controller.value * 200, 0),
                    child: child,
                  );
                },
                child: ReusableCard(
                  onPress: (){},
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        _weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                _weight = --_weight;
                            });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                _weight = ++_weight;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
              Expanded(child: AnimatedBuilder(
                animation: controller,
                builder: (_, Widget? child){
                  return Transform.translate(
                    offset: Offset(controller.value * -200, 0),
                    child: child,
                  );
                },
                child: ReusableCard(
                  onPress: (){},
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        _age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                --_age;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                ++_age;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ))
            ],
          )),
          BottomButton(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ReCalculatorScreen(result: 19.2)));
              },
              buttonTitle: 'CALCULATE'
          )
        ],
      ),
    );
  }
}
