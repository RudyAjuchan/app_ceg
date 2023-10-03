import 'package:asistencia_ceg/pages/dashboard/navbar.dart';
import 'package:asistencia_ceg/utils/global.colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class Calendario extends StatefulWidget{
  const Calendario({super.key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<Calendario> {

  DateTime? selectedDay;
  List <CleanCalendarEvent>? selectedEvent;

  final Map<DateTime, List<CleanCalendarEvent>> events = {
    DateTime (2023, 10, 20):[CleanCalendarEvent( 'Event A', startTime: DateTime(2023, 10, 20, 10,0), endTime: DateTime(2023, 10, 20, 12,0), description: 'A special event', color: Colors.blue.shade700),],
    DateTime (2023, 10, 25):[CleanCalendarEvent( 'Event B', startTime: DateTime(2023, 10, 25, 10,0), endTime: DateTime(2023, 10, 20, 12,0), description: 'A special event', color: Colors.blue.shade700),],
    DateTime (2023, 10, 30):[CleanCalendarEvent( 'Event C', startTime: DateTime(2023, 10, 30, 10,0), endTime: DateTime(2023, 10, 20, 12,0), description: 'A special event', color: Colors.blue.shade700),],
  };

  

  void _handleData(date){
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
    print(selectedDay);
  }

  @override
  void initState(){
    selectedEvent = events[selectedDay] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: GlobalColors.colorPrincipal,
        ),
      body: Container(
        alignment: Alignment.center,
        child: Calendar(
          locale: "es",
          startOnMonday: true,
          selectedColor: Colors.blue,
          todayColor: Colors.red,
          eventColor: Colors.green,
          eventDoneColor: Colors.amber,
          bottomBarColor: Colors.deepOrange,
          onRangeSelected: (range){
            print('Selected Day ${range.from}, ${range.to}');
          },
          onDateSelected: (date){
            return _handleData(date);
          },
          events: events,
          isExpanded: true,
          dayOfWeekStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black12,
            fontWeight: FontWeight.w100,
          ),
          bottomBarTextStyle: const TextStyle(
            color: Colors.white,
          ),
          hideBottomBar: false,
          hideArrows: false,
          weekDays: const ['Lun', 'Mar','Mié', 'Jue', 'Vie', 'Sáb', 'Dom'],
        ),
      ),
    );
  }
}



