import 'package:core/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_forge/common/constants/font_size.dart';
import 'package:todo_forge/shared/widgets/build_text.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/size_global.dart';

class CustomCalendarComp extends StatefulWidget {
  const CustomCalendarComp({super.key});

  @override
  State<CustomCalendarComp> createState() => _CustomCalendarCompState();
}

class _CustomCalendarCompState extends State<CustomCalendarComp> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // @override
  // void initState() {
  //   _selectedDay = _focusedDay;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          calendarFormat: _calendarFormat,
          startingDayOfWeek: StartingDayOfWeek.monday,
          availableCalendarFormats: const {
            CalendarFormat.month: 'Month',
            CalendarFormat.week: 'Week',
          },
          rangeSelectionMode: RangeSelectionMode.disabled,
          focusedDay: _focusedDay,
          firstDay: DateTime.now(),
          lastDay: DateTime.utc(2030, 1, 1),
          onPageChanged: (focusDay) {
            _focusedDay = focusDay;
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
        ),
        Container(
          width: MediaQuery.sizeOf(context).width,
          margin: const EdgeInsets.symmetric(horizontal: SizeGlobal.padding).copyWith(top: SizeGlobal.padding),
          padding: const EdgeInsets.symmetric(vertical: SizeGlobal.paddingSM, horizontal: SizeGlobal.padding),
          decoration: BoxDecoration(color: AppColor.primary2, borderRadius: BorderRadius.circular(5)),
          child: buildText(_selectedDay != null ? formatDate(dateTime: _selectedDay.toString()) : 'Select a date', Theme.of(context).primaryColor, textMedium,
              FontWeight.w400, TextAlign.start, TextOverflow.clip),
        ),
      ],
    );
  }
}
