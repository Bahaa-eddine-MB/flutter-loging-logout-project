import 'package:flutter/material.dart';


import 'Widgets/Header_widget.dart';
import 'Widgets/drawer_widget.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  

  @override
  Widget build(BuildContext context) {
      double h = MediaQuery.of(context).size.height;
      double w = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Profile page",
      //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //   ),
      //   elevation: 0.5,
      //   iconTheme: IconThemeData(color: Colors.white),
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
              // gradient: LinearGradient(
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //     colors: <Color>[
              //   Theme.of(context).primaryColor,
              //   Theme.of(context).colorScheme.secondary
              // ]
              // )
        //       color: Theme.of(context).primaryColor
        //       ),
        // ),
        // actions: [
        //   Container(
        //     margin: EdgeInsets.only(top: 16, right: 16),
            // child: Stack(         //Notification
            //   children: <Widget>[
            //     Icon(Icons.notifications),
            //     Positioned(
            //       right: 0,
            //       child: Container(
            //         padding: EdgeInsets.all(1),
            //         decoration: BoxDecoration(
            //           color: Colors.red,
            //           borderRadius: BorderRadius.circular(6),
            //         ),
            //         constraints: BoxConstraints(
            //           minWidth: 12,
            //           minHeight: 12,
            //         ),
            //         child: Text(
            //           "0",
            //           style: TextStyle(color: Colors.white, fontSize: 8),
            //           textAlign: TextAlign.center,
            //         ),
            //       ),
            //     )
            //   ],
            // ),
      //     )
      //   ],
      // ),
      drawer: drawer_widget(),
  //     bottomNavigationBar: BottomNavigationBar(
  //       elevation: 20,
  //       selectedItemColor: Colors.black,
  //       unselectedItemColor: Colors.black,
  // onTap: (index){
  //         print(index);
  //       },
  //       selectedLabelStyle: const TextStyle(fontFamily: 'Montserrat',),
  //       unselectedLabelStyle: const TextStyle(fontFamily: 'Montserrat',),
  //       selectedFontSize: MediaQuery.of(context).size.width*0.03,
  //       unselectedFontSize: MediaQuery.of(context).size.width*0.03,
  //       items: [
  //         BottomNavigationBarItem(icon:Icon(Icons.person,color:Colors.blueAccent,size: h*0.048,),label: 'Profil',
          
  //         ),
  //         BottomNavigationBarItem(icon: Icon(Icons.home,color:Colors.blueAccent,size: h*0.048,),label: 'Home'),
  //         BottomNavigationBarItem(icon: Icon(Icons.list_alt,color:Colors.blueAccent,size: h*0.048,),label: 'Appointments'),

  //       ],
  //     ),
      // Drawer(
      //   child: Container(
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //       stops: [0.0, 1.0],
      //       colors: [
      //         Theme.of(context).primaryColor.withOpacity(0.1),
      //         Theme.of(context).colorScheme.secondary.withOpacity(0.4),
      //       ],
      //     )),
      //     child: ListView(
      //       children: [
      //         DrawerHeader(
      //           decoration: BoxDecoration(
      //             color: Theme.of(context).primaryColor,
      //             gradient: LinearGradient(
      //               begin: Alignment.topLeft,
      //               end: Alignment.bottomRight,
      //               stops: [0.0, 1.0],
      //               colors: [
      //                 Theme.of(context).primaryColor,
      //                 Theme.of(context).colorScheme.secondary,
      //               ],
      //             ),
      //           ),
      //           child: Container(
      //             alignment: Alignment.bottomLeft,
      //             child: Text(
      //               "Doctell",
      //               style: TextStyle(
      //                   fontSize: 25,
      //                   color: Colors.white,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //         ),
      //         ListTile(
      //           leading: Icon(
      //             Icons.screen_lock_landscape_rounded,
      //             size: h*0.04  ,
      //             color: Theme.of(context).primaryColor,
      //           ),
      //           title: Text(
      //             "Splash screen",
      //             style: TextStyle(
      //                 fontSize: 17, color: Theme.of(context).primaryColor),
      //           ),
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => SplashScreen(
      //                           title: "Splash Screen",
      //                         )));
      //           },
      //         ),
      //         Divider(
      //           color: Theme.of(context).primaryColor,
      //           height: h*0.0001,
      //         ),
      //         ListTile(
      //           leading: Icon(
      //             Icons.login_rounded,
      //             size: h*0.04,
      //             color: Theme.of(context).primaryColor,
      //           ),
      //           title: Text(
      //             "Login Page",
      //             style: TextStyle(
      //                 fontSize: 17, color: Theme.of(context).primaryColor),
      //           ),
      //           onTap: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => LoginPage()));
      //           },
      //         ),
      //         Divider(
      //           color: Theme.of(context).primaryColor,
      //           height: h*0.0001,
      //         ),
      //         ListTile(
      //           leading: Icon(
      //             Icons.person_add_alt_1,
      //             size: h*0.04,
      //             color: Theme.of(context).primaryColor,
      //           ),
      //           title: Text(
      //             "Home page",
      //             style: TextStyle(
      //                 fontSize: 17, color: Theme.of(context).primaryColor),
      //           ),
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => HomePgae()));
      //           },
      //         ),
      //         Divider(
      //           color: Theme.of(context).primaryColor,
      //           height: h*0.0001,
      //         ),
      //         ListTile(
      //            leading: Icon(
      //             Icons.password_rounded,
      //             size: h*0.04,
      //             color: Theme.of(context).primaryColor,
      //           ),
      //           title: Text(
      //             "Forgot Password Page",
      //             style: TextStyle(
      //                 fontSize: 17, color: Theme.of(context).primaryColor),
      //           ),
      //           onTap: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
      //           },    
      //         ),
      //         Divider(
      //           color: Theme.of(context).primaryColor,
      //           height: h*0.0001,
      //         ),
      //         ListTile(
      //            leading: Icon(
      //             Icons.verified_user_sharp,
      //             size: h*0.04,
      //             color: Theme.of(context).primaryColor,
      //           ),
      //           title: Text(
      //             "Verification Page",
      //             style: TextStyle(
      //                 fontSize: 17, color: Theme.of(context).primaryColor),
      //           ),
      //           onTap: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => VerificationPage()));
      //           },
                
      //         ),
      //         Divider(
      //           color: Theme.of(context).primaryColor,
      //           height: h*0.0001,
      //         ),
      //         ListTile(
      //           leading: Icon(
      //             Icons.logout_rounded,
      //             size: h*0.04,
      //             color: Theme.of(context).primaryColor,
      //           ),
      //           title: Text(
      //             "Logout",
      //             style: TextStyle(
      //                 fontSize: 17, color: Theme.of(context).primaryColor),
      //           ),
      //           onTap: () {
      //             SystemNavigator.pop();
      //           },
                
      //         ),
      //         Divider(
      //           color: Theme.of(context).primaryColor,
      //           height: h*0.0001,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: h*0.3,
              child: HeaderWidget(h*0.3, false, Icons.house_rounded),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  SizedBox(height: h*0.08),
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
                      size: h*0.13,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(
                    height: h*0.03,
                  ),
                  Text(
                    "Bahaa Eddine",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: h*0.03,
                  ),
                  Text(
                    "A doctor",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: h*0.03,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 4.0),
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
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          leading: Icon(Icons.my_location),
                                          title: Text("Location"),
                                          subtitle: Text("Algeria"),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.email),
                                          title: Text("Email"),
                                          subtitle:
                                              Text("bm.bouzeboudja@esi-sba.dz"),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.phone),
                                          title: Text("Phone"),
                                          subtitle: Text("246-6421-52"),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.person),
                                          title: Text("About Me"),
                                          subtitle: Text(
                                              "This is a about me link and you can khow about me in this section."),
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
  }

}
