  
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../common/them_helper.dart';
import '../homepage.dart';
import 'Widgets/Header_widget.dart';
import 'choose_type.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

//   IconData set =ImageIcon(
//      AssetImage("images/LogoWhite.png"),
// ) as IconData;

  @override
  Widget build(BuildContext context) {
      double h = MediaQuery.of(context).size.height;
      double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                  children: [
                    Container(
                    height: h*0.32,
                    child: HeaderWidget(h*0.33, false, Icons.person,)
                     ),
                     Center(
                       child: Container(    
                         height: h*0.25,
                         width: w*0.2,
                        child:
                        Center(
                          child: Image(
                            image: AssetImage("img/LogoWhite.png"),),
                        )
                       ),
                     ),
                  ],
                ),
              
              SafeArea(
                child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    //The login form
                    child: Column(
                      children: [
                            //  Container(
                            //     padding: EdgeInsets.all(10),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(100),
                            //       border: Border.all(
                            //           width: 5, color: Colors.white),
                            //       color: Colors.white,
                            //       boxShadow: [
                            //         BoxShadow(
                            //           color: Colors.black12,
                            //           blurRadius: 20,
                            //           offset: const Offset(5, 5),
                            //         ),
                            //       ],
                            //     ),
                            //     child: Icon(
                            //       Icons.person,
                            //       color: Colors.grey.shade900,
                            //       size: 80.0,
                            //     ),
                            //   ),
                            //   SizedBox(height:10),
                        Container(
                          height: h*0.12 ,
                          child: Image(image:AssetImage("img/blueLogo.png"))),
                        Text(
                          "Sign into your account",
                          style: TextStyle(color: Colors.grey),
                        ),
                        // Text(
                        //   "DocTell",
                        //   style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                        // ),
                        SizedBox(
                          height: h*0.015,
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
                                  height: h*0.03,
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
                                  height: h*0.018,
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
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    onPressed:  () {
                                     
                                     if (_formKey.currentState!.validate()) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => HomePgae()
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
      ),
    );
  }

  buttonBoxDecoration(BuildContext context) {}

  forgotPasswordPage() {}
}