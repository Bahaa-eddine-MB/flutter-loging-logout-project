import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cote_pat/Page/Docter_Profil/time_buttons.dart';
import 'package:cote_pat/Page/SplashScreen.dart';
import 'package:cote_pat/Page/Widgets/Header_widget.dart';
import 'package:cote_pat/Page/adress.dart';
import 'package:cote_pat/homepage.dart';
import 'Widgets/drawer_widget.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  final _formKey = GlobalKey<FormState>();
  State<ProfilePage> createState() => _ProfilePageState();
}

Future getData() async {
  await FirebaseFirestore.instance
      .collection("Docuser")
      .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((value) {
    value.docs.forEach((element) {
      firstname = element.data()["firstname"];
    });
  });
  return firstname;
}

Future getDataLast() async {
  await FirebaseFirestore.instance
      .collection("Docuser")
      .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((value) {
    value.docs.forEach((element) {
      lastname = element.data()["lastname"];
    });
  });
}

Future getDataEmail() async {
  await FirebaseFirestore.instance
      .collection("Docuser")
      .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((value) {
    value.docs.forEach((element) {
      email = element.data()["email"];
    });
  });
}

Future getDataWilaya() async {
  await FirebaseFirestore.instance
      .collection("Adresses")
      .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((value) {
    value.docs.forEach((element) {
      wilayat = element.data()["wilaya"];
    });
  });
}

Future getDataStreet() async {
  await FirebaseFirestore.instance
      .collection("Adresses")
      .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((value) {
    value.docs.forEach((element) {
      stret = element.data()["street"];
    });
  });
}

Future getDataHousenum() async {
  await FirebaseFirestore.instance
      .collection("Adresses")
      .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((value) {
    value.docs.forEach((element) {
      number = element.data()["house_number"];
    });
  });
}

Future getDataPhone() async {
  await FirebaseFirestore.instance
      .collection("Docuser")
      .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((value) {
    value.docs.forEach((element) {
      phone = element.data()["phone"];
    });
  });
}

Future getDataS() async {
  await FirebaseFirestore.instance
      .collection("Docuser")
      .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((value) {
    value.docs.forEach((element) {
      specialite = element.data()["specialité"];
    });
  });
}

Future getabout() async {
  await FirebaseFirestore.instance
      .collection("Docuser")
      .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((value) {
    value.docs.forEach((element) {
      about = element.data()["about"];
    });
  });
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("Patuser")
        .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
      setState(() {
        event.docs.forEach((element) {
          firstname = element.data()["firstname"];
          print("about :${element.data()["firstname"]}");
        });
      });
    });
  FirebaseFirestore.instance
        .collection("Patuser")
        .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
      setState(() {
        event.docs.forEach((element) {
          email = element.data()["email"];
          print("about :${element.data()["email"]}");
        });
      });
    });
    FirebaseFirestore.instance
        .collection("Patuser")
        .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
      setState(() {
        event.docs.forEach((element) {
          lastname = element.data()["lastname"];
          print("about :${element.data()["lastname"]}");
        });
      });
    });
    FirebaseFirestore.instance
        .collection("Adresses")
        .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
      setState(() {
        event.docs.forEach((element) {
          wilayat = element.data()["wilaya"];
          print("about :${element.data()["wilaya"]}");
        });
      });
    });
    FirebaseFirestore.instance
        .collection("Patuser")
        .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
      setState(() {
        event.docs.forEach((element) {
          phone = element.data()["phone"];
          print("about :${element.data()["phone"]}");
        });
      });
    });
   

  
    FirebaseFirestore.instance
        .collection("Adresses")
        .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
      setState(() {
        event.docs.forEach((element) {
          stret = element.data()["street"];
          print("about :${element.data()["street"]}");
        });
      });
    });
     FirebaseFirestore.instance
        .collection("Adresses")
        .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
      setState(() {
        event.docs.forEach((element) {
          number = element.data()["house_number"];
          print("about :${element.data()["house_number"]}");
        });
      });
    });
// getData();
//     getDataEmail();
//     getDataLast();
//     getDataPhone();
//     getDataS();
//     getDataEmail();
//     getDataHousenum();
//     getDataStreet();
//     getDataWilaya();
//     print(wilaya);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return NewWidget(h: h);
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.h,
  }) : super(key: key);

  final double h;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return Scaffold(
            drawer: drawer_widget(),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: h * 0.3,
                    child: HeaderWidget(h * 0.3, false, Icons.house_rounded),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      children: [
                        SizedBox(height: h * 0.08),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: 5, color: Colors.white),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 20,
                                    offset: const Offset(5, 5)),
                              ]),
                          child: Icon(
                            Icons.person,
                            size: h * 0.13,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.03,
                        ),
                        Text(
                          "${firstname} ${lastname}",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      
                        SizedBox(
                          height: h * 0.03,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 8.0, bottom: 4.0),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "User Information",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Card(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          ...ListTile.divideTiles(
                                            color: Colors.grey,
                                            tiles: [
                                              ListTile(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 4),
                                                leading:
                                                    Icon(Icons.my_location),
                                                title: Text("Location"),
                                                subtitle: Text(
                                                    "${wilayat} :${stret} ${number}"),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.email),
                                                title: Text("Email"),
                                                subtitle: Text("${email}"),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.phone),
                                                title: Text("Phone"),
                                                subtitle: Text("${phone}"),
                                              ),
                                           
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
