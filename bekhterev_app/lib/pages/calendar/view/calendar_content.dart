import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'utils.dart';
import 'package:bekhterev_app/pages/calendar/view/blocks/events_modal.dart';

final List<String> title = <String>[
  'Событие 1',
  'Событие 2',
  'Событие 3',
  'Событие 4',
  'Событие 5'
];
final List<String> subtitle = <String>[
  'Описание события 1',
  'Описание события 2',
  'Описание события 3',
  'Описание события 4',
  'Описание события 5'
];
final List<String> time = <String>[
  '10.00 – 12.00',
  '15.00 – 16.00',
  '15.10 – 17.30',
  '09.00 – 12.00',
  '13.30 – 15.00'
];

class CalendarContent extends StatefulWidget {
  CalendarContent({Key? key}) : super(key: key);

  @override
  _CalendarContentState createState() => _CalendarContentState();
}

class _CalendarContentState extends State<CalendarContent> {
  late final ValueNotifier<List<Event>> _selectedEvents;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode =
      RangeSelectionMode.toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Color(0xFF42A1F0),
          padding: EdgeInsets.only(bottom: 15),
          child: TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            locale: 'ru_RU',
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              defaultTextStyle: TextStyle().copyWith(fontSize: 15.0, color: Color(0xFFFFFFFF)),
              holidayTextStyle: TextStyle().copyWith(fontSize: 15.0, color: Color(0xFFE8C883)),
              weekendTextStyle: TextStyle().copyWith(fontSize: 15.0, color: Color(0x80FFFFFF)),
              outsideTextStyle: TextStyle().copyWith(fontSize: 15.0, color: Color(0x33FFFFFF)),
              outsideDaysVisible: false,
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle().copyWith(fontSize: 15.0, color: Color(0xFFFFFFFF)),
              weekendStyle: TextStyle().copyWith(fontSize: 15.0, color: Color(0x80FFFFFF)),
            ),
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle().copyWith(fontSize: 15.0, color: Color(0xFFFFFFFF)),
              headerPadding: EdgeInsets.only(bottom: 5),
              leftChevronIcon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
              rightChevronIcon: Icon(Icons.keyboard_arrow_right, color: Colors.white),
              formatButtonDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFFFFFFF), width: 1)),
              formatButtonTextStyle: TextStyle().copyWith(fontSize: 15.0, color: Color(0xFFFFFFFF)),
            ),
            calendarBuilders: CalendarBuilders(
              selectedBuilder: (context, date, _) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(4.0),
                  width: 45,
                  height: 45,
                  child: Text(
                    '${date.day}',
                    style: TextStyle().copyWith(fontSize: 15.0),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFE8C883),
                    borderRadius: BorderRadius.circular(28),
                  ),
                );
              },
              todayBuilder: (context, date, _) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(4.0),
                  width: 45,
                  height: 45,
                  child: Text(
                    '${date.day}',
                    style: TextStyle().copyWith(fontSize: 15.0),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(28),
                  ),
                );
              },
              singleMarkerBuilder: (context, date, events) {
                return Container(
                  transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                  decoration: new BoxDecoration(
                    color: Color(0xFF2280CE),
                    shape: BoxShape.circle,
                  ),
                  margin: const EdgeInsets.only(left: 1, right: 1),
                  width: 6,
                  height: 6,
                );
              },
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
        ),
        Expanded(
          child: Container(
              color: Color(0xFF2280CE),
              child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, event, _) {
                  return ListView.builder(
                    itemCount: event.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 8, left: 30, right: 30),
                        child: Material(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                          color: Color(0xFFFFFFFF),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            child: ListTile(
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '${title[index]}'.toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF222222)),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 5),
                                            child: Text(
                                              '${subtitle[index]}',
                                              style: TextStyle(
                                                  fontSize: 14.0, color: Color(0xFF979797)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            '${time[index]}'.toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF222222)),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            splashColor: Color(0xFFF8D17F),
                            highlightColor: Color(0x80F5F6F7),
                            onTap: () {
                              print('${event[index]}');

                              showModalBottomSheet<void>(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ModalEvents();
                                  });
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              )),
        ),
      ],
    );
  }
}
