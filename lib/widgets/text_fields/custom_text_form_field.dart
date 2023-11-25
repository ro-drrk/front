import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_cart/helper/constant.dart';

class CTextFormField extends StatefulWidget {
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
  });

  @override
  State<CTextFormField> createState() => _CTextFormFieldState();
}

class _CTextFormFieldState extends State<CTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.passwordInVisible,
      cursorColor: kBrand800,
      cursorWidth: 2,
      cursorHeight: 20,
      cursorOpacityAnimates: true,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: widget.labelText,
        labelStyle: GoogleFonts.inter(
          textStyle: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        prefixStyle: GoogleFonts.inter(
          textStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        prefixText: widget.preText,
        prefixIcon: widget.preIcon,
        suffixIcon: widget.isSuffixIcon
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.passwordInVisible = !widget.passwordInVisible;
                  });
                },
                splashRadius: 1,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                icon: Icon(
                  widget.sufIcon,
                  color: kBrand800,
                ),
              )
            : null,
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
