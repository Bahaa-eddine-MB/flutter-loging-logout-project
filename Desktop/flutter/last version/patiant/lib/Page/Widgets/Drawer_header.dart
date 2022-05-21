import 'package:flutter/material.dart';

class drawer_header extends StatefulWidget {
  const drawer_header({Key? key}) : super(key: key);

  @override
  State<drawer_header> createState() => _drawer_headerState();
}

class _drawer_headerState extends State<drawer_header>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Padding:
    EdgeInsets.only(top: MediaQuery.of(context).padding.top);

    return Container(
      
      color: Color.fromRGBO(57, 126, 245, 20),
      width: double.infinity,
      height: 250,
    );
  }
}