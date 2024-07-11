import 'package:flutter/material.dart';
import 'package:weniatest/design_system/buttons/button_styles.dart';

class WeniaOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const WeniaOutlinedButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: outlinedButtonStyle,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
