import 'package:flutter/material.dart';
import 'package:weniatest/design_system/colors/colors.dart';
import 'package:weniatest/design_system/text/text_styles.dart';

ButtonStyle filledButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: onPrimaryColor,
  backgroundColor: primaryColor,
  textStyle: buttonTextStyle,
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);

ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
  foregroundColor: primaryColor,
  backgroundColor: Colors.transparent,
  textStyle: buttonTextStyle,
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  side: BorderSide(color: primaryColor, width: 2),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);
