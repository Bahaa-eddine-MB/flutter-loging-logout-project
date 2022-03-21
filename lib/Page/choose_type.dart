import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/Registration_pageForDoc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Registration_page.dart';

class chooseType extends StatefulWidget {
  const chooseType({Key? key}) : super(key: key);

  @override
  State<chooseType> createState() => _chooseTypeState();
}

class _chooseTypeState extends State<chooseType> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          
        //  color: Colors.blue,       
            GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegistrationPageForDoc()));
            },
              child: 
              Container(     
           decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                 HexColor("#397EF5"),
                Colors.lightBlueAccent
              ])),
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
             child: Text(
                'Doctor'.toUpperCase(),
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                    ), //title
                textAlign: TextAlign.end, //aligment
              ),
            ),
          ),
        
        
        GestureDetector(
          onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()));
              },
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                    HexColor("#BECFFF"),
                   Colors.white,
                ])),
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            
           child:
            Text(
                'Patient'.toUpperCase(),
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue), //title
                textAlign: TextAlign.end, //aligment
              ),
            ),
          ),
      ],
    );
  }
}
