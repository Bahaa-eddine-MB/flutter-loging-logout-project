import 'package:flutter/material.dart';
import 'constants.dart';
import 'body_mes_rdvs.dart';

class Mesrdv extends StatelessWidget {
  const Mesrdv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bcgcolor,
      body: BodyMesRdvs(),
    );
  }

  AppBar rdvAppBar() {
    return AppBar(
      backgroundColor: bcgcolor,
      leading: const BackButton(color: Colors.black),
      titleSpacing: -15,
      title: const Text(
        "Retour",
        style: TextStyle(color: Colors.black),
      ),
      elevation: 0,
    );
  }
}
