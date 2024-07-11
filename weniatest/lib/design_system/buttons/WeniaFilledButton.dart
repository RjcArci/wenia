import 'package:flutter/material.dart';
import 'package:weniatest/design_system/buttons/button_styles.dart';

class WeniaFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const WeniaFilledButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: filledButtonStyle,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
