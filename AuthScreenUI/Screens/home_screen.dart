import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/Colors/pallete.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome User!",
          style: GoogleFonts.poppins(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Pallete.buttonBlue
          ),
        ),
      ),
    );
  }
}