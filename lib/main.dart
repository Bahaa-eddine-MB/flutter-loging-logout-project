import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Page/SplashScreen.dart';

void main() {
  runApp(const LoginDoctell());
}

class LoginDoctell extends StatelessWidget {
  const LoginDoctell({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color _PrimaryColor = HexColor("#397EF5");
    Color _accentColor = Colors.lightBlueAccent;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Logout Page',
      theme: ThemeData(
        primaryColor: _PrimaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100, 
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: _accentColor),
        primarySwatch: Colors.grey,
      ),
      home: const SplashScreen(title: 'Doctell Login Page'),
    );
  }
}


