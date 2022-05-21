import 'package:flutter/material.dart';
import 'package:flutter_application_2/Page/Mes_Rdvs/mes_rdvs.dart';
import 'package:flutter_application_2/Page/profile_page.dart';
import 'Page/Widgets/Header_widget.dart';
import 'Page/Widgets/categoriecard.dart';
import 'Page/Widgets/doctorcard.dart';
import 'Page/Widgets/drawer_widget.dart';
import 'Page/Widgets/mytitle.dart';
import 'Page/Widgets/search_input.dart';
import 'model/doctors.dart';

class HomePgae extends StatefulWidget {
  int selectedindex = 1;
  @override
  _HomePgaeState createState() => _HomePgaeState();
}

int index = 0;
List<String> cat = [
  'Géneralistes',
  'Radiologues',
  'Pshyciatres',
  'Cardiologues',
  'Pédiatres'
];
List<String> img = [
  'assets/images/stethoscope.png',
  'assets/images/ct-scan.png',
  'assets/images/brain.png',
  'assets/images/cardiogram.png',
  'assets/images/specialist.png'
];
List<Widget> items = [
  const Image(image: AssetImage('assets/images/accueil.png')),
  const Image(image: AssetImage('assets/images/rendez-vous.png')),
  const Image(
    image: AssetImage('assets/images/profil-de-lutilisateur.png'),
  )
];
final _list = Doctor.blog();
final _list2 = Doctor.blog2();
List<Widget> mypages = [ProfilePage(), home(), Mesrdv()];

class _HomePgaeState extends State<HomePgae> {
  int selectedindex = 1;

  // const buttomNavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int selectedIndex;
    List<IconData> data = [
      Icons.home,
      Icons.person_add_alt_1_rounded,
      Icons.list_rounded,
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,

      drawer: drawer_widget(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });

          print(selectedindex);
        },
        currentIndex: selectedindex,
        elevation: 20,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black54,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Montserrat',
        ),
        selectedFontSize: MediaQuery.of(context).size.width * 0.03,
        unselectedFontSize: MediaQuery.of(context).size.width * 0.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt,
              ),
              label: 'Appointments'),
        ],
      ),
      body: mypages.elementAt(selectedindex),
      //  home(h: h),

      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(20),
      //   child: Material(
      //     elevation: 2,
      //     borderRadius: BorderRadius.circular(40),
      //     color: Colors.white,
      //     shadowColor: const Color.fromRGBO(217, 217, 217, 20),
      //     child: SizedBox(
      //         height: 40,
      //         child: ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           itemCount: data.length,
      //           padding: const EdgeInsets.symmetric(horizontal: 30),
      //           itemBuilder: (ctx, i) => Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 30),
      //             child: GestureDetector(
      //               onTap: () {
      //                 setState(() {
      //                   selectedIndex = i;
      //                 });

      //               },
      //               child: AnimatedContainer(
      //                 duration: const Duration(milliseconds: 250),
      //                 width: 40,
      //                 child: Icon(
      //                   data[i],
      //                   color: i == selectedIndex ? Colors.blue : Colors.grey,
      //                   size: 35,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         )),
      //   ),
      // ),
    );
  }
}

class home extends StatelessWidget {
  const home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: <Widget>[
            SizedBox(
              height: h * 0.23,
              child: HeaderWidget(h * 0.23, false, Icons.notification_add),
            ),
            Container(
                padding: const EdgeInsets.only(top: 50),
                child: const SearchInput()),
          ]),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(7.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const MyTitle(title: 'Categories', fontsize: 25),
              const Padding(padding: EdgeInsets.only(top: 8.0)),
              SizedBox(
                height: h * 0.11,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cat.length,
                    itemBuilder: (context, index) {
                      return CategorieCard(
                          title: cat[index], image: img[index]);
                    }),
              ),
              const MyTitle(title: 'Top Doctors', fontsize: 25),
              SizedBox(
                height: h * 0.23,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      return DoctorCard(doc: _list[index]);
                    }),
              ),
              const MyTitle(title: 'Doctors', fontsize: 25),
              SizedBox(
                  height: h * 0.22,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _list2.length,
                      itemBuilder: (context, index) {
                        return DoctorCard(doc: _list[index]);
                      }))
            ]),
          )),
        ],
      ),
    );
  }
}
