import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_cart/helper/constant.dart';

class CTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final String? preText;
  final Widget? preIcon;
  final IconData? sufIcon;
  final bool isSuffixIcon;
  bool passwordInVisible;

  CTextFormField({
    super.key,
    required this.labelText,
    required this.preText,
    required this.preIcon,
    required this.sufIcon,
    this.isSuffixIcon = false,
    this.passwordInVisible = false,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: passwordInVisible,
      cursorColor: kBrand800,
      cursorWidth: 2,
      cursorHeight: 20,
      cursorOpacityAnimates: true,
      decoration: InputDecoration(
        labelText: labelText,
        prefixText: preText,
        suffixIcon: isSuffixIcon
            ? IconButton(
                onPressed: () {
                  passwordInVisible = !passwordInVisible;
                },
                splashRadius: 1,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                icon: Icon(
                  sufIcon,
                  color: kBrand800,
                ),
              )
            : null,
        prefixIcon: preIcon,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: GoogleFonts.inter(
          textStyle: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        prefixStyle: GoogleFonts.inter(
          textStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        filled: true,
        fillColor: Colors.grey[100],
        // constraints: BoxConstraints(minHeight: 46),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: kBrand800,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      ),
    );
  }
}
