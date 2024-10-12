import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_ui/Blueprint/form_blueprint.dart';
import 'package:login_ui/Screens/home_screen.dart';
import 'package:login_ui/Screens/signup_page.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoggedin = false;

  Future<void> login() async{
    final response = await http.post(
      Uri.parse("https://reqres.in/api/login"),
      body: {
        "email": FormBlueprint.emailController.text,
        "password": FormBlueprint.passwordController.text
      }
    );

    if(200 == response.statusCode){
      const storage = FlutterSecureStorage();
      final data = json.decode(response.body);
      storage.write(key: "auth_token", value: data["token"]);
      isLoggedin = true;
    }else{
      isLoggedin = false;
    }
  }



  @override
  Widget build(BuildContext context) {
    return FormBlueprint(
      typeTitle: "Login here",
      welcoming1: "Welcome back you've",
      welcoming2: "been missed!",
      welcomingSize: 18,
      welcomingWeight: FontWeight.w600,
      buttonType: "Sign in",
      isDisplayed: true,
      oppositeType: "Create new account",
      oppositePage: const SignUp(),
      action: () async{
        await login();
        if(isLoggedin){
          // ignore: use_build_context_synchronously
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        }else{
          showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (BuildContext context){
              return  const AlertDialog(
                title: Text("Error..."),
                content: Text("An error occured while logging in."),
              );
            }
          );
        }

      },
    );
  }
}