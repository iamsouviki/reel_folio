import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reel_folio/onboarding/widget/screen_title_widget.dart';
import 'package:reel_folio/util/size_config.dart';

class UserDOBWidget extends StatelessWidget {
  const UserDOBWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ScreenTitleWidget(text: 'BIRTHDAY'),
        SizedBox(
          height: screenHeight! / 3,
          child: CupertinoTheme(
            data: CupertinoThemeData(
              brightness: Brightness.dark,
              textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle: TextStyle(
                  fontSize: screenWidth! * 22  / 375,
                  color: Colors.white,
                ),
              ),
            ),
            child: CupertinoDatePicker(
              onDateTimeChanged: (val){},
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime(1990,12,12),
              maximumYear: 2006,
              minimumYear: 1970,
              dateOrder: DatePickerDateOrder.mdy,
            ),
          ),
          /*child: DatePickerWidget(
            looping: true, // d
            // efault is not looping
            firstDate: DateTime.now(), //DateTime(1960),
            //  lastDate: DateTime(2002, 1, 1),
//              initialDate: DateTime.now(),// DateTime(1994),
            dateFormat:
            // "MM-dd(E)",
            "dd/MMMM/yyyy",
  //      locale: DatePicker.localeFromString('th'),
            onChange: (DateTime newDate, _) {

            },
            pickerTheme: const DateTimePickerTheme(
              backgroundColor: Colors.transparent,
              itemTextStyle:
              TextStyle(color: Colors.white, fontSize: 19),
              dividerColor: Colors.white,
            ),
          ),*/
        ),
      ],
    );
  }
}
