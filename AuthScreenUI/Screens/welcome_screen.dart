import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/Screens/login_page.dart';
import 'package:login_ui/Blueprint/page_design.dart';
import 'package:login_ui/Colors/pallete.dart';
import 'package:login_ui/Screens/signup_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PageDesign(
      content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Welcome pic
            SizedBox(
              width: 350,
              height: 300,
              child: Image.asset("assets/welcome_picPNG.png")
            ),

            const SizedBox(height: 73),

            //Slogan
            Text(
              "Discover Your",
              style: GoogleFonts.poppins(
                color: Pallete.buttonBlue,
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Dream Job here",
              style: GoogleFonts.poppins(
                color: Pallete.buttonBlue,
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 23),

            //Some text here
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Explore all the existing job roles based on your\n",
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: Pallete.darkTextColor
                ),
                children: [
                  TextSpan(
                    text: "interest and study major",
                    style: GoogleFonts.poppins(
                      fontSize: 11
                    )
                  )
                ]
              )
            ),

            const SizedBox(height: 80),

            //Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Login button
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
                  },
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll<Color>(Pallete.buttonBlue),
                    padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 14, horizontal: 38)),
                    shape: WidgetStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    shadowColor: const WidgetStatePropertyAll<Color>(Color(0xffCBD6FF)),
                    elevation: const WidgetStatePropertyAll<double>(10)
                  ),
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Pallete.lightTextColor,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),

                //Register button
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                  }, //Redirecting the the register page
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      "Register",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Pallete.darkTextColor,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ),
                )
              ],
            )
          ],
        )
    );
  }
}