import 'dart:io';
import 'package:cote_pat/Page/showLoading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import '../common/them_helper.dart';
import '../homepage.dart';
import 'VerifyEmailPage.dart';
import 'Widgets/Header_widget.dart';
import 'profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationPageForDoc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageForDocState();
  }
}

var photo;
File? file;

class _RegistrationPageForDocState extends State<RegistrationPageForDoc> {
  final _formKey = GlobalKey<FormState>();
  File? pickedImage;

  pickImage(ImageSource imageType) async {
    try {
      photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  imagePickerOption() {
    var pic;
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Choissir Une Image ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      pic = await pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      pic = await pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pic = null;
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool checkedValue = false;
  bool checkboxValue = false;
  late UserCredential userCredential;
  var firstname, lastname, email, password, phone;
  // List<String> items = [
  //   "cardiologue",
  //   "pédiatre",
  //   "généraliste",
  //   "radiologue",
  //   "physiatre"
  // ];

  String? specialite;
  Future signUp() async {
    if (_formKey.currentState!.validate() ) {
      var formdata = _formKey.currentState;
      formdata?.save();

      try {
        showLoading(context);
        userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await FirebaseFirestore.instance
            .collection("Patuser")
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .set({
          "owner": FirebaseAuth.instance.currentUser?.uid,
          "email": email,
          "firstname": firstname,
          "lastname": lastname,
          "isAccepted": false,
          "phone": phone,
        });

        // await FirebaseFirestore.instance.collection("Docuser").add({
        //   "about":null,
        //    "owner":FirebaseAuth.instance.currentUser?.uid,
        //     "email": email,
        //     "firstname": firstname,
        //     "lastname":lastname,
        //      "isAccepted":false,
        //      "phone":phone,
        //      "specialité":specialite,
        // });

        Navigator.pushReplacementNamed(context, "verify");

        // Navigator.pushReplacementNamed(context, "home");

        //   User? user = FirebaseAuth
        //                 .instance.currentUser;
        //             await user?.sendEmailVerification();
        //             showDialog(
        //                 context: context,
        //                 builder:
        //                     (BuildContext context) {
        //                   return ThemHelper().alartDialog(
        //                       "Email verification:",
        //                       "We have sent a mail to your email to verify it.",
        //                       context);
        //                 },
        //               );
        //                if (userCredential
        //                   .user?.emailVerified ==
        //               true){print(userCredential.user?.emailVerified);
        //               print("==================================");
        //  Navigator.pushReplacementNamed(context, "home");}
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ThemHelper().alartDialog(
                  "Password", "The password provided is too weak.", context);
            },
          );
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ThemHelper().alartDialog("Email",
                  "The account already exists for that email.", context);
            },
          );
          print('The account already exists for that email.');
        } else {
          Navigator.of(context).pop();

          print(e);

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ThemHelper()
                  .alartDialog("erreur", e.message.toString(), context);
            },
          );
        }
      }
    }
  }

  

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

  
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: h * 0.22,
              child:
                  HeaderWidget(h * 0.22, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: w * 0.005, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: h * 0.14,
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                  child: IconButton(
                                    onPressed: () async {
                                      await imagePickerOption();
                                      print("ffffffffffffff");
                                      if (photo != null) {
                                        print(
                                            "YEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEES");
                                        file = File(photo.path);
                                        //  var nameimage = basename()
                                      } else {
                                        print(
                                            "NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  OOOOOOO");
                                      }
                                    },
                                    icon: Icon(
                                      Icons.add_a_photo,
                                      color: Colors.grey.shade700,
                                      size: h * 0.045,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: h * 0.01),
                        Text(
                          "Welcome to our app!".toUpperCase(),
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: h * 0.06,
                        ),
                        // profileImage(),
                        Container(
                          child: TextFormField(
                            onSaved: (val) {
                              firstname = val;
                            },
                            decoration: ThemHelper().textInputDecoration(
                                'First Name', 'Enter your first name'),
                            validator: (val) {
                              int? x = val?.length;
                              if (x! > 20) {
                                return "user name cant be larger than 20 letter";
                              }
                              if (x! < 2) {
                                return "user name cant be less than 3 letter";
                              }
                              if (val!.isEmpty) {
                                return "Please enter your first name";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: h * 0.03,
                        ),
                        Container(
                          child: TextFormField(
                            onSaved: (val) {
                              lastname = val;
                            },
                            decoration: ThemHelper().textInputDecoration(
                                'Last Name', 'Enter your last name'),
                            validator: (val) {
                              int? x = val?.length;
                              if (x! > 20) {
                                return "user name cant be larger than 20 letter";
                              }
                              if (x! < 2) {
                                return "user name cant be less than 3 letter";
                              }

                              if (val!.isEmpty) {
                                return "Please enter your last name";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemHelper().inputBoxDecorationShaddow(),
                        ),
                                        
                        // Container(
                        //   child: Specialite(),
                        //   // decoration: ThemHelper().inputBoxDecorationShaddow(),
                        // ),
                        SizedBox(height: h * 0.03),
                        Container(
                          child: TextFormField(
                            onSaved: (val) {
                              phone = val;
                            },
                            decoration: ThemHelper().textInputDecoration(
                                "Mobile Number", "Enter your mobile number"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Enter a valid phone number";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: h * 0.03),
                        Container(
                          child: TextFormField(
                            onSaved: (val) {
                              email = val;
                            },
                            decoration: ThemHelper().textInputDecoration(
                                "E-mail address", "Enter your email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: h * 0.03),
                        Container(
                          child: TextFormField(
                            onSaved: (val) {
                              password = val;
                            },
                            obscureText: true,
                            decoration: ThemHelper().textInputDecoration(
                                "Password", "Enter your password"),
                            validator: (val) {
                              int? x = val?.length;
                              if (x! > 20) {
                                return "password cant be larger than 20 letter";
                              }
                              if (x! < 8) {
                                return "password cant be smaller than 8 letter";
                              }

                              if (val!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: h * 0.03),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text(
                                      "I accept all terms and conditions.",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: h * 0.04),
                        Container(
                          decoration: ThemHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                              style: ThemHelper().buttonStyle(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  "Register".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () async {
                            

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Confirmation:"),
                                      content: Text(
                                          "Are you sure your informations?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("CANCEL")),
                                        TextButton(
                                            onPressed: () async {
                                              Navigator.of(context).pop();

                                              signUp();
                                            },
                                            child: Text("CONFIRMER"))
                                      ],
                                    );

                                    ;
                                  },
                                );
                                // Navigator.of(context).pushAndRemoveUntil(
                                //     MaterialPageRoute(
                                //         builder: (context) => HomePgae()),
                                //     (Route<dynamic> route) => false);

                                // if (_formKey.currentState!.validate() ) {
                                //   var formdata = _formKey.currentState;

                                //   formdata?.save();

                                //   try {
                                //     userCredential = await FirebaseAuth.instance
                                //         .createUserWithEmailAndPassword(
                                //       email: email,
                                //       password: password,
                                //     );
                                //     Navigator.pushReplacementNamed(
                                //         context, "adress");

                                //     //   User? user = FirebaseAuth
                                //     //                 .instance.currentUser;
                                //     //             await user?.sendEmailVerification();
                                //     //             showDialog(
                                //     //                 context: context,
                                //     //                 builder:
                                //     //                     (BuildContext context) {
                                //     //                   return ThemHelper().alartDialog(
                                //     //                       "Email verification:",
                                //     //                       "We have sent a mail to your email to verify it.",
                                //     //                       context);
                                //     //                 },
                                //     //               );
                                //     //                if (userCredential
                                //     //                   .user?.emailVerified ==
                                //     //               true){print(userCredential.user?.emailVerified);
                                //     //               print("==================================");
                                //     //  Navigator.pushReplacementNamed(context, "home");}
                                //   } on FirebaseAuthException catch (e) {
                                //     if (e.code == 'weak-password') {
                                //       showDialog(
                                //         context: context,
                                //         builder: (BuildContext context) {
                                //           return ThemHelper().alartDialog(
                                //               "Password",
                                //               "The password provided is too weak.",
                                //               context);
                                //         },
                                //       );
                                //       print(
                                //           'The password provided is too weak.');
                                //     } else if (e.code ==
                                //         'email-already-in-use') {
                                //       showDialog(
                                //         context: context,
                                //         builder: (BuildContext context) {
                                //           return ThemHelper().alartDialog(
                                //               "Email",
                                //               "The account already exists for that email.",
                                //               context);
                                //         },
                                //       );
                                //       print(
                                //           'The account already exists for that email.');
                                //     } else {
                                //       print(e);

                                //       showDialog(
                                //         context: context,
                                //         builder: (BuildContext context) {
                                //           return ThemHelper().alartDialog(
                                //               "erreur",
                                //               e.message.toString(),
                                //               context);
                                //         },
                                //       );
                                //     }
                                //   }

                                  //  if (userCredential
                                  //                 .user?.emailVerified ==
                                  //             false) {
                                  //           User? user = FirebaseAuth
                                  //               .instance.currentUser;
                                  //           await user?.sendEmailVerification();
                                  //           showDialog(
                                  //               context: context,
                                  //               builder:
                                  //                   (BuildContext context) {
                                  //                 return ThemHelper().alartDialog(
                                  //                     "Email verification:",
                                  //                     "We have sent a mail to your email to verify it.",
                                  //                     context);
                                  //               },
                                  //             );
                                  //         }

                                // }
                              }),
                        ),
                        SizedBox(height: h * 0.05),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
