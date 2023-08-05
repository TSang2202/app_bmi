import 'package:bmi_app/constants/app_colors.dart';
import 'package:bmi_app/constants/app_text_style.dart';
import 'package:bmi_app/screens/calculator_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.push(context, MaterialPageRoute(builder: (_) => const CalculatorScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: const Image(
                  image: AssetImage('assets/images/splash_logo.png'),
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'BMI CACULATOR',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1.5
                ),
              )
            ],
          ),

          const Column(
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color> (Colors.pink),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Check your BMI',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white60,
                    fontSize: 20,
                    letterSpacing: 1.2
                ),
              )
            ],
          )


        ],
      ),
    );
  }
}


