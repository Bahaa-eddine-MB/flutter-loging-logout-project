import 'package:flutter/material.dart';
import 'const.dart';
import 'time_buttons.dart';
import 'calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'Header_widget.dart';
import 'biotablelist.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'invoice_pdf/pdf_invoice_api.dart';

DateFormat format = DateFormat('dd - MM - yyyy hh:mm');

class DoctorPage extends StatelessWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    const bcgcolor = Color.fromARGB(237, 1, 22, 70);
    const txtcolor = Colors.black;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).colorScheme.secondary,
            ]),
          ),
        ),
        backgroundColor: bcgcolor,
        leading: const BackButton(color: Colors.black),
        titleSpacing: -15,
        title: const Text(
          "Retour",
          style: TextStyle(color: txtcolor),
        ),
        elevation: 0,
      ),
      body: BodyBio(
        h: h,
        w: w,
      ),
    );
  }
}

int itim = 100;
late DateTime iday;
int a = 5;
int b = 4;

class BodyBio extends StatefulWidget {
  const BodyBio({
    Key? key,
    required this.h,
    required this.w,
  }) : super(key: key);

  final double h;
  final double w;

  @override
  State<BodyBio> createState() => _BodyBioState();
}

class _BodyBioState extends State<BodyBio> with TickerProviderStateMixin {
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    double h = MediaQuery.of(context).size.height;
    // double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(children: [
          SizedBox(
            height: widget.h * 0.15,
            child: HeaderWidget(widget.h * 0.15, false, Icons.house_rounded),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 5, color: Colors.white),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5)),
                    ]),
                child: Icon(
                  Icons.person,
                  size: widget.h * 0.13,
                  color: Colors.grey.shade400,
                ),
              ),
              SizedBox(
                height: widget.h * 0.01,
              ),
              const Text(
                "Doctor's Name",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ]),
          )
        ]),
        const Divider(
          endIndent: 70,
          indent: 70,
          thickness: 4,
        ),
        //
        TabBar(
            onTap: (value) {
              itim = 77;
              controller.unselectAll();
            },
            labelColor: labelColorTab,
            unselectedLabelColor: unselectedLabelColorTab,
            controller: _tabController,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: indicatorColorTab,
            tabs: const [
              Tab(
                text: "Schuedle",
              ),
              Tab(text: "Biography")
            ]),

        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 8.6109),
          width: double.maxFinite,
          height: 500-141,
          child: TabBarView(controller: _tabController, children: [
            Column(
              children: [
                Container(
                  child: const Calendar(),
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                ),
                SizedBox(
                  height: widget.h * 0.03,
                ),
                  const TimeButtons(),
                SizedBox(
                  height: widget.h * 0.055,
                ),
                Container(
                  height: widget.h * 0.05,
                  width: widget.w * 0.60,
                  decoration: BoxDecoration(
                    //  color:Color.fromARGB(255, 51, 139, 255) ,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  //color: Color.fromARGB(255, 51, 139, 255),
                  child: TextButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent.withOpacity(0.5)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(makeAppColor),
                        // overlayColor:MaterialStateProperty.all<Color>(Colors.grey  ),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: () async {
                      try {
                        if (itim == 77) {
                          throw Exception;
                        }
                        //print('You have selected this $itim button \nYou have selected this $iday day');

                        _showMaterialDialog();
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      } catch (e) {
                        //print('goddamn it select a time and a day idiot');
                        SnackBar snackBar = SnackBar(
                          backgroundColor: Colors.red.shade700,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Please select a day and a time ',
                                style: TextStyle(fontSize: 17),
                              ),
                              Icon(
                                Icons.info_outline,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          duration: const Duration(seconds: 3),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text(
                      "Make An Appointement",
                      //style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SingleChildScrollView(
              child: BioTableList(),
            )
          ]),
        ),
      ],
    );
  }

  makeAnAppointment() async {
    var notref = FirebaseFirestore.instance.collection('Appointments');
    var ref = FirebaseFirestore.instance.collection('doctors');

    List<int> timeSlotIndex = [];

    var resposne = await ref
        .doc('yzreO3TrzblximKsxdz2') //the doctor clicked uid
        .collection('day-month-year')
        .doc(iday.toString())
        .get();
    timeSlotIndex = resposne['timeindex'].cast<int>();

    timeSlotIndex[itim] = itim;

    await ref
        .doc('yzreO3TrzblximKsxdz2') //the doctor clicked uid
        .collection('day-month-year')
        .doc(iday.toString())
        .set({'timeindex': timeSlotIndex});

    await notref.add({
      'DoctorsName': 'dr Yassine Zelmati',
      'PatientName': 'Ahmed',
      'date': Timestamp.fromDate(dateToUpload.add(DateTime.now()
          .timeZoneOffset)), //  DateTime.now().timeZoneOffset kinda solve error of timezone
      'doctorUID': 'yzreO3TrzblximKsxdz2',
      'patientUID': '43vju27PaOZptGuNQvDC',
    });
    itim = 77;
  }

  void _showMaterialDialog() {
    SnackBar snackBar = SnackBar(
      backgroundColor: const Color.fromARGB(255, 88, 184, 115),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            width: 5,
          ),
          Text(
            'Appointment succeeded ',
            style: TextStyle(fontSize: 17),
          ),
          Icon(
            Icons.check_circle_outline,
            color: Colors.white,
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: const Center(child: Text('Are You Sure ?')),
            content: SizedBox(
              height: widget.h * 0.35, //248
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListTile(
                    horizontalTitleGap: 2,
                    leading: Icon(Icons.person_outline),
                    title: Text('Doctor Zelmati Yassine'),
                  ),
                  const Divider(thickness: 2),
                  const ListTile(
                    horizontalTitleGap: 2,
                    leading: Icon(Icons.category),
                    title: Text('Cardiologue'),
                  ),
                  const Divider(thickness: 2),
                  ListTile(
                    horizontalTitleGap: 2,
                    leading: const Icon(Icons.calendar_month),
                    title: Text(dateConfrimBox(
                        DateTime.now().withTime(timeSlotToDateTime()))),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close')),
              TextButton(
                onPressed: () {
                  makeAnAppointment();
                  invoice();

                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('Confrim'),
              )
            ],
          );
        });
  }
}

String dateConfrimBox(DateTime timestamp) {
  DateFormat format = DateFormat.yMMMEd('fr');
  DateFormat fodrmat = DateFormat('HH:mm');

  return format.format(timestamp) +
      '\n' +
      fodrmat.format(timestamp) +
      ' - ' +
      fodrmat.format(timestamp.add(const Duration(hours: 1)));
}
