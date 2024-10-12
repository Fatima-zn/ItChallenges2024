import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/Colors/pallete.dart';

class CustomField extends StatelessWidget {
  final String hint;
  final bool isHidden;
  final TextEditingController controller;
  const CustomField({super.key, required this.hint, required this.isHidden, required this.controller});

  @override
  Widget build(BuildContext context) {

    OutlineInputBorder inputBorder(Color color, double width) => OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: width
      ),
      borderRadius: BorderRadius.circular(10)
    );


    return TextFormField(
      controller: controller,
      obscureText: isHidden,
      decoration: InputDecoration(
        filled: true,
        fillColor: Pallete.fieldBackColor,
        contentPadding: const EdgeInsets.all(15),
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500
        ),
        focusedBorder: inputBorder(Pallete.buttonBlue, 1.5),
        enabledBorder: inputBorder(Pallete.textFieldColor, 1)
      ),
    );
  }

}

