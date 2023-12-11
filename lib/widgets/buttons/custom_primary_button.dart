import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/main.dart';

class CPrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CPrimaryButton({
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 0),
          backgroundColor: kBrand600,
          foregroundColor: Colors.white,
          elevation: 6,
          shadowColor: Colors.black26,
          textStyle: customLightTheme.textTheme.labelLarge,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
