import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import '../common/them_helper.dart';
import 'Docter_Profil/Header_widget.dart';
import 'adress.dart';

class VerifyEmailPage extends StatefulWidget {
  VerifyEmailPage({Key? key}) : super(key: key);

  @override
  
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  
  bool isEmailVerified = false;
  Timer? timer;
  bool canResendEmail = false;

  @override
  
  void initState() {
    // TODO: implement initState
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(Duration(seconds: 5), (_) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      
      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override

  Widget build(BuildContext context) => isEmailVerified
      ? adress()
      : 
      Scaffold(
        
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                height: 200,
                child: HeaderWidget(200, false, Icons.person_add_alt_1_rounded),
              ),
              
              Column(
                children: [
               SizedBox(
                    height: 220,
                  ),
                  Text(
                    "Email verification!".toUpperCase(),
                    style: TextStyle(color: Colors.grey,fontSize: 20),
                  ),
                  Center(
                    child: Text(
                      "You have to verify your email in order to access the application!".toUpperCase(),
                      style: TextStyle(color: Colors.grey,fontSize: 10),
                    ),
                  ),
                  SizedBox(
                    height: 130,
                  ),
                  Text(
                    'A verification email has been sent to your email.',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton.icon(
                    style:
                    
                     ElevatedButton.styleFrom(
                      elevation: 10,
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 8),
                      // minimumSize: Size.fromHeight(50),
                    ),
                    onPressed: () {
                      canResendEmail ? sendVerificationEmail() : showDialog(
            context: context,
            builder: (BuildContext context) {
              return ThemHelper().alartDialog(
                  "Email",
                  "email has been sent",
                  context);
            },
          );
                    },
                    icon: Icon(
                      Icons.email,
                      size: 32,
                    ),
                    label: Text(
                      "Resend Email".toUpperCase(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacementNamed(context, "login");
                    },
                    style:
                        ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50),),
                      
                    child: Text(
                      "Cancel".toUpperCase(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
}
