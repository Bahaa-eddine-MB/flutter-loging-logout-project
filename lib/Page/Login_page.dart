import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/choose_type.dart';
import 'package:flutter_application_1/Page/profile_page.dart';
import 'package:flutter_application_1/common/them_helper.dart';
import 'Registration_page.dart';
import 'Widgets/Header_widget.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded),
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  //The login form
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: Image(
                          image: AssetImage("img/LogingLogo.png"),
                        ),
                      ),
                      Text(
                        "Sign into your account",
                        style: TextStyle(color: Colors.grey),
                      ),
                      // Text(
                      //   "DocTell",
                      //   style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                      // ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                
                                decoration: ThemHelper().textInputDecoration(
                                 'User Name', 'Enter your user name'),
                              validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your user name";
                              }
                              return null;
                            },
                                    
                                
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                obscureText: true,
                                decoration: ThemHelper().textInputDecoration(
                                    'Password', 'Enter your password'),
                                    validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                                
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                  Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), 
                                  );},
                                  child: Text( "Forgot your password?", style: TextStyle( color: Colors.grey, ),
                                ),
                                
                                ),
                                
                              ),
                              Container(
                                decoration:
                                    ThemHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'sign in'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                   if (_formKey.currentState!.validate()) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage()
                                    ),
                                        (Route<dynamic> route) => false
                                );
                              }
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //  child:Text("Don't have an account? Create!"),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(text: "Don't have an account?"),
                                  TextSpan(
                                    text: "Create!",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    chooseType()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                ])),
                              )
                            ],
                          ))
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  buttonBoxDecoration(BuildContext context) {}

  forgotPasswordPage() {}
}
