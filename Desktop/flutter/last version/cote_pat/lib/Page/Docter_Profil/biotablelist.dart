import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class BioTableList extends StatelessWidget {
  const BioTableList({ 
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                ...ListTile.divideTiles(
                  color: Colors.grey,
                  tiles: [
                    const ListTile(
                      contentPadding: EdgeInsets.fromLTRB(20, 0, 10, 10),
                      leading: Icon(Icons.category),
                      title: Text("Specialité"),
                      subtitle: Text("Cardiologue"),
                    ),
                    const ListTile(
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      leading: Icon(Icons.monetization_on_outlined),
                      title: Text("Cost"),
                      subtitle: Text("2000 DA"),
                    ),
                    ListTile(
                      onTap: () {
                        _callNumber();
                      }, 
                      contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      leading: const Icon(Icons.phone),
                      title: const Text("Phone"),
                      subtitle: const Text("246-6421-52"),
                    ),
                    const ListTile(
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      leading: Icon(Icons.email),
                      title: Text("Email"),
                      subtitle: Text("meow_meow@esi-sba.dz"),
                    ),
                    ListTile(
                      onTap:() {
                        MapsLauncher.launchCoordinates(
                      35.18359755545525, -0.6482344025623622
                    );
                      }, 
                      contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      leading: const Icon(Icons.my_location),
                      title: const Text("Sidi Bel Abbes"),
                      subtitle: const Text("click to show directions"),
                    ),
                    const ListTile(
                      contentPadding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                      leading: Icon(Icons.person),
                      title: Text("About Me"),
                      subtitle: Text(
                          "Im a good doctor trust me bro also leave a 5.5 ratings cuz why not"),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
_callNumber() async{
  const number = '08592119XXXX'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);}

  