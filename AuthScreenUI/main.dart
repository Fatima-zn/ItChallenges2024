import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_ui/Screens/home_screen.dart';
import 'package:login_ui/Screens/welcome_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  const storage = FlutterSecureStorage();
  final token = await storage.read(key: 'auth_token');

  runApp(MyApp(token: token)); //here i pass the token as a parameter
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: token != null? const HomeScreen() : const WelcomeScreen(),
      //checking if the token exists or not to display the appropriate screen
    );
  }
}






