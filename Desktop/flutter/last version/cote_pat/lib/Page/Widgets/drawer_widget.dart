import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Registration_pageForPat.dart';
import './Drawer_Items.dart';
import 'Drawer_header.dart';

class drawer_widget extends StatefulWidget {
  @override
  State<drawer_widget> createState() => _drawer_widgetState();
}

class _drawer_widgetState extends State<drawer_widget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    final padding = EdgeInsets.symmetric(horizontal: 20);
    final String text1 = "Modifier Mes infos";
    final String text2 = "Se Deconnecter";
    final String text3 = "Mes notification";
    final String text4 = "À propos";

    return Theme(
      data: Theme.of(context)
          .copyWith(canvasColor: Color.fromRGBO(245, 245, 245, 20)),
      child: Drawer(
        child: Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const drawer_header(),
              const SizedBox(
                height: 15, //pading between items
              ),
              SizedBox(height: h * 0.05),
              ListTile(
                leading: Icon(
                  Icons.edit,
                  size: h * 0.035,
                  color: Colors.black,
                ),
                title: Text(
                  "Modifier profile",
                  style: TextStyle(fontSize: h * 0.022),
                ),
                onTap: () {
                  //  Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => RegistrationPage()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.person_add_alt_1,
                  size: h * 0.035,
                  color: Colors.black,
                ),
                title: Text(
                  "Feed Back",
                  style: TextStyle(fontSize: h * 0.022),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationPageForDoc()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  size: h * 0.035,
                  color: Colors.black,
                ),
                title: Text(
                  "Se Deconnecter",
                  style: TextStyle(fontSize: h * 0.022),
                ),
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Confirmation:"),
                        content: Text("Are you sure you want to disconnect?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("CANCEL")),
                          TextButton(
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                Navigator.pushReplacementNamed(
                                    context, "login");
                              },
                              child: Text("CONFIRMER"))
                        ],
                      );

                      ;
                    },
                  );
                },
              ),
              TextButton(
                //button À propos
                onPressed: () {},
                child: Text(text4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
