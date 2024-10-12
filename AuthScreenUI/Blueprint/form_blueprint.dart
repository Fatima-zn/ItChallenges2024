import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/Blueprint/custom_field.dart';
import 'package:login_ui/Blueprint/page_design.dart';
import 'package:login_ui/Colors/pallete.dart';

class FormBlueprint extends StatelessWidget {
  final String typeTitle;
  final String welcoming1;
  final String welcoming2;
  final double welcomingSize;
  final FontWeight welcomingWeight;
  final String buttonType;
  final bool isDisplayed;
  final String oppositeType;
  final Widget oppositePage;
  final VoidCallback action;

  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController = TextEditingController();
  static final TextEditingController cPasswordController = TextEditingController();
  const FormBlueprint(
    { super.key,
      required this.typeTitle,
      required this.welcoming1,
      required this.welcoming2,
      required this.welcomingSize,
      required this.welcomingWeight,
      required this.buttonType,
      required this.isDisplayed,
      required this.oppositeType,
      required this.oppositePage,
      required this.action
    }
  );

  @override
  Widget build(BuildContext context) {
    return PageDesign(
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                typeTitle,
                style: GoogleFonts.poppins(
                  color: Pallete.buttonBlue,
                  fontSize: 26,
                  fontWeight: FontWeight.bold
                ),
              ),

              isDisplayed? const  SizedBox(height: 26) : const  SizedBox(height: 10),

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "$welcoming1 \n",
                  style: GoogleFonts.poppins(
                    fontSize: welcomingSize,
                    fontWeight: welcomingWeight,
                    color: Pallete.darkTextColor
                  ),
                  children: [
                    TextSpan(
                      text: welcoming2,
                      style: GoogleFonts.poppins(
                        fontSize: welcomingSize,
                        fontWeight: welcomingWeight
                      )
                    )
                  ]
                )
              ),

              const SizedBox(height: 53),


              //Email field
              CustomField(
                controller: FormBlueprint.emailController,
                hint: "Email",
                isHidden: false
              ),

              const SizedBox(height: 29),

              //Password field
              CustomField(
                controller: FormBlueprint.passwordController,
                hint: "Password",
                isHidden: true
              ),

              const SizedBox(height: 30),

              isDisplayed?
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot your password?",
                  style: GoogleFonts.poppins(
                    color: Pallete.buttonBlue,
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                  ),
                ),
              )
              :
              CustomField(hint: "Confirm password", isHidden: true, controller: FormBlueprint.cPasswordController),

              isDisplayed? const SizedBox(height: 30) : const SizedBox(height: 45),

              SizedBox(
                width: double.infinity, //so that the button takes all the available space horizontally
                child: ElevatedButton(
                  onPressed: action,
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll<Color>(Pallete.buttonBlue),
                    padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 15)),
                    shape: WidgetStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    shadowColor: const WidgetStatePropertyAll<Color>(Color(0xffCBD6FF)),
                    elevation: const WidgetStatePropertyAll<double>(10)
                  ),
                  child: Text(
                    buttonType,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Pallete.lightTextColor,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => oppositePage));
                },
                child: Text(
                  oppositeType,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Pallete.textFieldColor
                  ),
                )
              ),

              const SizedBox(height: 65),

              Text(
                "Or continue with",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Pallete.buttonBlue
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 44,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Pallete.iconsBackColor
                      ),
                      width: 60,
                      height: 44,
                      child: Image.asset("assets/google_iconPNG.png", scale: 3),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Pallete.iconsBackColor
                      ),
                      width: 60,
                      height: 44,
                      child: Image.asset("assets/facebook_iconPNG.png", scale: 3),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Pallete.iconsBackColor
                      ),
                      width: 60,
                      height: 44,
                      child: Image.asset("assets/apple_iconPNG.png", scale: 3),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      )
    );

  }
}