import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const RoundIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      shape: const CircleBorder(),
      fillColor: const Color.fromARGB(255, 255, 173, 66),
      child: Icon(
        icon,
        color: Colors.white,

      ),
    );
  }
}
