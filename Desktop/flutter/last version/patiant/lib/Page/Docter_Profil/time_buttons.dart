import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'const.dart';
import 'profil_page.dart';

class TimeButtons extends StatefulWidget {
  const TimeButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<TimeButtons> createState() => _TimeButtonsState();
}

List<int> disabledIndex = [];

final controller = GroupButtonController();

class _TimeButtonsState extends State<TimeButtons> {
  @override
  void initState() {
    controller.disableIndexes([0, 1, 2, 3, 4, 5]); // must excute
    

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GroupButton(
        controller: controller,
        enableDeselect: false,
        maxSelected: 1,
        options: GroupButtonOptions(
            unselectedColor: unselectedColorT,
            unselectedTextStyle: unselectedTextStyleT,
            selectedColor: selectedColorT,
            spacing: w * 0.05,
            buttonHeight: h * 0.05,
            buttonWidth: w * 0.24,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            direction: Axis.horizontal,
            groupingType: GroupingType.wrap,
            mainGroupAlignment: MainGroupAlignment.spaceEvenly),
        buttons: const [
          '8:00 - 9:00 ',
          '9:00 - 10:00',
          '10:00 - 11:00',
          '11:00 - 12:00',
          '14:00 - 15:00',
          '15:00 - 16:00'
        ],
        onSelected: (itime, isSelected) async => {
              setState(() {
                itim = itime;
                timeSlotToDateTime();
                //print('Button $itim selected');
                dateToUpload = DateTime.now().withTime(timeSlotToDateTime());
              }),
            });
  }
}

late DateTime dateToUpload;

int timeSlotToDateTime() {
   int r=77;
  switch (itim) {
    case 0:
      {
        r = 08;
      }
      break;
    case 1:
      {
        r = 09;
      }
      break;
    case 2:
      {
        r = 10;
      }
      break;
    case 3:
      {
        r = 11;
      }
      break;
    case 4:
      {
        r = 14;
      }
      break;
    case 5:
      {
        r = 15;
      }
      break;
  }
  return r;
}

extension DateTimeExtensions on DateTime {
  DateTime withTime([int hour = 0, int minute = 0]) =>
      DateTime(iday.year, iday.month, iday.day, hour, minute);
}
