import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cote_pat/Page/showLoading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../common/them_helper.dart';
import 'Docter_Profil/Header_widget.dart';

class adress extends StatefulWidget {
  adress({Key? key}) : super(key: key);

  @override
  State<adress> createState() => _adressState();
}

CollectionReference docuser = FirebaseFirestore.instance.collection("Docuser");

final _formKey = GlobalKey<FormState>();
List<String> items = [
  "Wilaya d'Adrar",
  "Wilaya de Chlef",
  "Wilaya de Laghouat",
  "Wilaya d'Oum El Bouaghi",
  "Wilaya de Batna",
  "Wilaya de Béjaïa",
  "Wilaya de Biskra",
  "Wilaya de Béchar",
  "Wilaya de Blida",
  "Wilaya de Bouira",
  "Wilaya de Tamanrasset",
  "Wilaya de Tébessa",
  "Wilaya de Tlemcen",
  "Wilaya de Tiaret",
  "Wilaya de Tizi Ouzou",
  "Wilaya d'Alger",
  "Wilaya de Djelfa",
  "Wilaya de Jijel",
  "Wilaya de Sétif",
  "Wilaya de Saïda",
  "Wilaya de Skikda",
  "Wilaya de Sidi Bel Abbès",
  "Wilaya d'Annaba",
  "Wilaya de Guelma",
  "Wilaya de Constantine",
  "Wilaya de Médéa",
  "Wilaya de Mostaganem",
  "Wilaya de M'Sila",
  "Wilaya de Mascara",
  "Wilaya d'Ouargla ",
  "Wilaya d'Oran",
  "Wilaya d'El Bayadh",
  "Wilaya d'Illizi",
  "Wilaya de Bordj Bou Arreridj",
  "Wilaya de Boumerdès",
  "Wilaya d'El Tarf",
  "Wilaya de Tindouf",
  "Wilaya de Tissemsilt",
  "Wilaya d'El Oued",
  "Wilaya de Khenchela",
  "Wilaya de Souk Ahras",
  "Wilaya de Tipaza",
  "Wilaya de Mila",
  "Wilaya d'Aïn Defla",
  "Wilaya de Naâma",
  "Wilaya d'Aïn Témouchent",
  "Wilaya de Ghardaïa",
  "Wilaya de Relizane",
  "Wilaya de Timimoun",
  "Wilaya de Bordj Badji Mokhtar",
  "Wilaya d'Ouled Djellal",
  "Wilaya de Béni Abbès",
  "Wilaya d'In Salah",
  "Wilaya d'In Guezzam",
  "Wilaya de Touggourt",
  "Wilaya de Djanet",
  "Wilaya d'El M'Ghair",
  "Wilaya d'El Meniaa"
];
String? wilaya;
var street;
var num;

class _adressState extends State<adress> {
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
              height: h * 0.3,
              child: HeaderWidget(h * 0.3, true, Icons.location_city),
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
                        SizedBox(height: h * 0.23),
                        Text(
                          "Adress page !".toUpperCase(),
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                        SizedBox(
                          height: h * 0.08,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          child: Text(
                            "Selectioner votre wilaya:",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 17),
                          ),
                        ),
                        SizedBox(height: h * 0.03),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 17, vertical: 2),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: wilaya,
                              isExpanded: true,
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (item) =>
                                  setState(() => wilaya = item),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12, width: 2),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        SizedBox(height: h * 0.05),
                        Container(
                          child: TextFormField(
                            onSaved: (val) {
                              street = val;
                            },
                            decoration: ThemHelper().textInputDecoration(
                                "Street", "Enter your street"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if ((val!.isEmpty)) {
                                return "Enter a valid street adress";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: h * 0.05),
                        Container(
                          child: TextFormField(
                            onSaved: (val) {
                              num = val;
                            },
                            decoration: ThemHelper().textInputDecoration(
                                "House number", "Enter your house number"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if ((val!.isEmpty) ||
                                  !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Enter a valid house number";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: h * 0.05),
                        Container(
                          decoration: ThemHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                              style: ThemHelper().buttonStyle(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  "Valider".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                if (wilaya == null) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemHelper().alartDialog(
                                          "Wilaya:",
                                          "Selectioner votre wilaya svp!.",
                                          context);
                                    },
                                  );
                                }
                                if (_formKey.currentState!.validate() &&
                                    wilaya != null) {
                                  _formKey.currentState?.save();

                                  showLoading(context);
                                await FirebaseFirestore.instance.collection("Adresses").doc(FirebaseAuth.instance.currentUser?.uid).set
                                 ({
                                    "owner":
                                        FirebaseAuth.instance.currentUser?.uid,
                                    "wilaya": wilaya,
                                    "street": street,
                                    "house_number": num,
                                  });
                                 await Navigator.pushReplacementNamed(
                                      context, "splash");
                                }
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
