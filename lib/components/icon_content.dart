import 'package:bmi_app/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {

  final IconData icon;
  final String label;
  final Color colour;

  const IconContent({super.key, required this.icon, required this.label, required this.colour});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: colour,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
