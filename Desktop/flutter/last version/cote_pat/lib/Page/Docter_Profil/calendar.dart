import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'time_buttons.dart';
import 'profil_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'const.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _TableCalendar createState() => _TableCalendar();
}

class _TableCalendar extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
        enabledDayPredicate: (day) => !(day.weekday == 5), //cant click friday
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              DateTime dateTime = DateTime.now();
              //   print(dateTime.timeZoneName);
              //  print(dateTime.timeZoneOffset);
              itim = 77;
              iday = DateTime(
                  selectedDay.year, selectedDay.month, selectedDay.day);
              print(iday);
              // print( 'day ${selectedDay.day}-${selectedDay.month}-${selectedDay.year} selected');
              disableIndexes();
              //  print('*************************');
              //  print('$iday is selected');
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        calendarStyle: CalendarStyle(
          todayTextStyle: const TextStyle(color: todayTextColorC),
          todayDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: borderColorC),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          selectedDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: selectedDayColorC,
            borderRadius: BorderRadius.circular(10),
          ),
          defaultDecoration: boxDecoC,
          weekendDecoration: boxDecoC,
          rangeStartDecoration: boxDecoC,
          rowDecoration: boxDecoC,
          markerDecoration: boxDecoC,
          holidayDecoration: boxDecoC,
          outsideDecoration: boxDecoC,
          rangeEndDecoration: boxDecoC,
          disabledDecoration: boxDecoC,
          withinRangeDecoration: boxDecoC,
        ),
        // availableCalendarFormats:,
        calendarFormat: CalendarFormat.week,
        availableCalendarFormats: const {
          CalendarFormat.week: 'Week',
        },
        startingDayOfWeek: StartingDayOfWeek.saturday,
        weekendDays: const [DateTime.friday],
        focusedDay: _focusedDay,
        firstDay: DateTime.utc(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        lastDay: DateTime.utc(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + 5));
  }
}

var ref = FirebaseFirestore.instance.collection('doctors');

/////////////////////////this function calculate the days of the calendar and returns a list with the days in a specefic format needeed
List<DateTime> getDaysInBeteween(DateTime startDate, DateTime endDate) {
  List<DateTime> days = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(DateTime(startDate.year, startDate.month, startDate.day + i));
  }
  return days;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////this function is for disabling the already booked time slots for the specified doctor clicked

disableIndexes() async {
  FirebaseFirestore.instance
      .collection('doctors')
      .doc('yzreO3TrzblximKsxdz2')
      .collection('day-month-year')
      .doc(iday.toString())
      .snapshots()
      .listen((event) {
    controller.unselectAll();
    controller.enableIndexes([0, 1, 2, 3, 4, 5]);
    disabledIndex = event['timeindex'].cast<int>();
    controller.disableIndexes(disabledIndex);
  });
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//set the working days and the time slots for the new doctor created , this function will be called when creating new doctor and adding his fields
setDateOfNewDoctor() async {
  getDaysInBeteween(
          DateTime.utc(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
          DateTime.utc(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 5))
      .forEach((element) async {
    await ref
        .doc('yzreO3TrzblximKsxdz2') //the doctor clicked uid
        .collection('day-month-year')
        .doc(element.toString())
        .set({
      'timeindex': [77, 77, 77, 77, 77, 77]
    });
  });
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


