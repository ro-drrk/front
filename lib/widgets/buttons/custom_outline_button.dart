import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_cart/helper/constant.dart';

class COutlineButton extends StatelessWidget {
  final String buttonText;

  const COutlineButton({
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          buttonText,
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 0),
          backgroundColor: kBrand100,
          foregroundColor: kBrand600,
          animationDuration: Duration(milliseconds: 300),
          elevation: 6,
          side: BorderSide(
            width: 2,
            color: kBrand600,
          ),
          shadowColor: Colors.black26,
          padding: EdgeInsets.all(20),
          textStyle: GoogleFonts.inter(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
