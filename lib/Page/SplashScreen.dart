import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/Login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  bool _isVisible = false;

  _SplashScreenState() {
    new Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
      });
    });

    new Timer(Duration(milliseconds: 10), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  
  Widget build(BuildContext context) {
      double h = MediaQuery.of(context).size.height;
      double w = MediaQuery.of(context).size.width;

    return Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
        colors: [
          Theme.of(context).colorScheme.secondary,
          Theme.of(context).primaryColor
        ],
        begin: const FractionalOffset(0, 0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      )),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 1200),
        child: Center(
          
        child: 
              Container(
                height: h*0.3,
                width: w*0.3,
                child: Center(
                  // child: ClipOval(
                    child: Image(
                      image: AssetImage('img/logosplash.png',),
                    ),
                    // child: Icon(Icons.android_outlined,size:128),
                  // ),
                ),  
             
          ),
        ),
      ),
    );
  }
}
