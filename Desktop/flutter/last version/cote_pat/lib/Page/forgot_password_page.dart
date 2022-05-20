import 'package:cote_pat/common/them_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'widgets/header_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
      double h = MediaQuery.of(context).size.height;
      double w = MediaQuery.of(context).size.width;
      var emailcontroller;
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: h*0.35,
                child: HeaderWidget(h*0.35, true, Icons.password_rounded),
              ),
              SafeArea(
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Forgot Password?',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: h*0.02,),
                            Text('Enter the email address associated with your account.',
                              style: TextStyle(
                                // fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: h*0.02,),
                            Text('We will email you a verification code to check your authenticity.',
                              style: TextStyle(
                                color: Colors.black38,
                                // fontSize: 20,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: h*0.05),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: TextFormField(
                                onSaved: (val){
                                  emailcontroller = val;
                                },
                                decoration: ThemHelper().textInputDecoration("Email", "Enter your email"),
                                validator: (val){
                                  if(val!.isEmpty){
                                    return "Email can't be empty";
                                  }
                                  else if(!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                    return "Enter a valid email address";
                                  }
                                  return null;
                                },
                              ),
                              decoration: ThemHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: h*0.05 ),
                            Container(
                              decoration: ThemHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemHelper().buttonStyle(),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      40, 10, 40, 10),
                                  child: Text(
                                    "Send".toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onPressed: () async{
                                  if(_formKey.currentState!.validate()) {
                                    _formKey.currentState?.save();

                                    try {
                                       await FirebaseAuth.instance.sendPasswordResetEmail(email:emailcontroller);
                                   showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemHelper().alartDialog(
                                          "Alert:",
                                          "The email has been sent!.",
                                          context);
                                    },
                                  );
                                    } on FirebaseAuthException catch (e) {
                                      print(e);
                                      showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemHelper().alartDialog(
                                          "Alert:",
                                          e.message.toString(),
                                          context);
                                    },
                                  );
                                    }
                                  
                                
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: h*0.035),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: "Remember your password? "),
                                  TextSpan(
                                    text: 'Login',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => LoginPage()),
                                        );
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
    
  }
}