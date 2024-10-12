import 'package:flutter/material.dart';
import 'package:login_ui/Blueprint/form_blueprint.dart';
import 'package:login_ui/Screens/login_page.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isSignedUp = false;

  Future<void> signup() async{
    if(FormBlueprint.passwordController.text == FormBlueprint.cPasswordController.text){
        final response = await http.post(
        Uri.parse("https://reqres.in/api/register"),
        body: {
          'email': FormBlueprint.emailController.text,
          'password': FormBlueprint.passwordController.text
        }
      );

      if(200 == response.statusCode){
        isSignedUp = true;
      }else{
        isSignedUp = false;
      }
    }else{
      isSignedUp = false;
    }

  }


  @override
  Widget build(BuildContext context) {
    return FormBlueprint(
      typeTitle: "Create Account",
      welcoming1: "Create an account so you can explore all the",
      welcoming2: "existing jobs",
      welcomingSize: 12,
      welcomingWeight: FontWeight.w500,
      buttonType: "Sign up",
      isDisplayed: false,
      oppositeType: "Already have an account",
      oppositePage: const SignIn(),
      action: (){
        signup();
        if(isSignedUp){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
        }else{
          showDialog(
            context: context,
            builder: (BuildContext context){
              return  const AlertDialog(
                title: Text("Error..."),
                content: Text("An error occured while signing up."),
              );
            }
          );
        }
      },
    );
  }
}