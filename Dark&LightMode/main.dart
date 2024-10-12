import 'package:dark_light_mode/light_or_dark.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ThemeModeClass themeMode = ThemeModeClass();
  await themeMode.loadTheme();

  runApp(
    ChangeNotifierProvider<ThemeModeClass>(
      create: (_) => themeMode, //no need to use ThemeModeClass() here, because i already create an instance of this class above, and i MUST use it, because the theme stored in shared_preferences has been called in that instance
      child: const MyApp(),
    )
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeClass>(
      builder: (context, theme, child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme.themeData,
          home: const Primary(),
        );
      },
    );
  }
}




class Primary extends StatefulWidget {
  const Primary({super.key});

  @override
  State<Primary> createState() => _PrimaryState();
}

class _PrimaryState extends State<Primary> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeClass>(
      builder: (context, theme, child){
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(theme.isDark? "assets/Images/nighty.gif" : "assets/Images/sunny.gif", height: 170, width: 170),

                const SizedBox(height: 30),

                Switch(
                  activeColor: Colors.green,
                  value: theme.isDark,
                  onChanged: (value){
                    theme.toggleTheme();
                  }
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
