import 'dart:io';

import 'package:asistencia_ceg/pages/dashboard/navbar.dart';
import 'package:asistencia_ceg/utils/global.colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

var contextG;

class Calendario extends StatelessWidget {
const Calendario({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    contextG = context;
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text('Calendario escolar'),
        backgroundColor: GlobalColors.colorPrincipal,
        ),
      body: SfCalendar(
        view: CalendarView.schedule,
        firstDayOfWeek: 1,
        dataSource: MeetingDataSource(getAppointments()),
        onTap: calendarTapped,
      ),
    );
  }
}

List<Appointment> getAppointments(){
  List<Appointment> meetings = <Appointment>[];
  meetings.add(Appointment(startTime: DateTime(2023,09,06,7,30), endTime: DateTime(2023,09,06,12,30), subject: 'Actividades diversas', color: Colors.blue, notes: 'Actividades diversas por celebración del 202 aniversario de la independencia', recurrenceRule: 'FREQ=DAILY;COUNT=3'));
  meetings.add(Appointment(startTime: DateTime(2023,09,11,7,30), endTime: DateTime(2023,09,11,12,30), subject: 'Actividades diversas', color: Colors.blue, notes: 'Actividades diversas por celebración del 202 aniversario de la independencia', recurrenceRule: 'FREQ=DAILY;COUNT=2'));
  meetings.add(Appointment(startTime: DateTime(2023,09,12,7,30), endTime: DateTime(2023,09,12,12,30), subject: 'Decoración murales', color: Colors.yellow.shade800, notes: 'Decoración de murales patrios para todos los niveles.'));
  meetings.add(Appointment(startTime: DateTime(2023,09,13,6,45), endTime: DateTime(2023,09,13,12,30), subject: 'Caminata cívica', color: Colors.blue, notes: 'Caminata cívica de alumnos de Preprimaria y Primero Primaria'));
  meetings.add(Appointment(startTime: DateTime(2023,09,14,6,45), endTime: DateTime(2023,09,14,12,30), subject: 'Caminata cívica', color: Colors.orange, notes: 'Caminata cívica de alumnos de segundo a sexto primaria'));
  meetings.add(Appointment(startTime: DateTime(2023,09,14,16,0), endTime: DateTime(2023,09,14,20,00), subject: 'Acto cultural', color: Colors.green, notes: 'Acto cultural, todo el alumnado de todos los niveles deberán asistir, el no asistir será motivo de disminución de 5 puntos, a todos los encargados se hace la cordial invitación'));
  meetings.add(Appointment(startTime: DateTime(2023,09,15,6,45), endTime: DateTime(2023,09,15,12,30), subject: 'Caminata cívica', color: Colors.purple, notes: 'Caminata cívica de alumnos de básicos y diversificado'));
  meetings.add(Appointment(startTime: DateTime(2023,09,18,7,30), endTime: DateTime(2023,09,18,12,30), subject: 'Descanso', color: Colors.blueGrey, notes: 'Descanso para toda la comunidad educativa CEG por actividades patrias'));
  meetings.add(Appointment(startTime: DateTime(2023,09,19,7,30), endTime: DateTime(2023,09,19,12,30), subject: 'Reinicio actividades', color: Colors.blueGrey, notes: 'Reinicio de actividades académicas para toda la comunidad educativa CEG'));
  //ACTIVIDADES OCTUBRE
  meetings.add(Appointment(startTime: DateTime(2023,10,02,7,30), endTime: DateTime(2023,10,02,12,30), subject: 'semana de repaso', color: Colors.pink, notes: 'Semana de repaso, previo a pruebas finales del cuarto bimesre 2023 para todos los niveles', recurrenceRule: 'FREQ=DAILY;COUNT=5'));
  meetings.add(Appointment(startTime: DateTime(2023,10,09,7,30), endTime: DateTime(2023,10,09,12,30), subject: 'Exámenes finales', color: Colors.teal, notes: 'Semana de exámenes finales (15 puntos) de la cuarta unidad 2023, para todos los niveles', recurrenceRule: 'FREQ=DAILY;COUNT=5'));
  meetings.add(Appointment(startTime: DateTime(2023,10,20,7,30), endTime: DateTime(2023,10,20,12,30), subject: 'Entrega de notas', color: Colors.indigo, notes: 'Entrega de notas de fin de ciclo 2023 a padres de familia, solamente se entregarán notas por vía electrónica a los alumnos que aprueben todas las materias del ciclo escolar 2023 con notas en el rango de 60 a 100, FAVOR ESTAR SOLVENTES AL MES DE OCTUBRE DE 2023'));
  meetings.add(Appointment(startTime: DateTime(2023,10,23,8,0), endTime: DateTime(2023,10,23,12,0), subject: 'Entrevista personal docente', color: Colors.redAccent, notes: 'Entrevista con el personal docente del CEG por resultados obtenidos(para alumnos con notas abajo de los 70 puntos) durante el ciclo escolar 2023, para entregar información del rendimiento académico, favor de presentarse con el alumno. Etrega de guias de estudio a alumnos de recuperación y nivelación'));
  meetings.add(Appointment(startTime: DateTime(2023,10,23,7,30), endTime: DateTime(2023,10,23,16,0), subject: 'Inicio de inscripciones', color: Colors.pink, notes: 'Inicio de inscripciones para el ciclo escolar 2024. Solamente para alumnos que estén solventes de pagos de colegiaturas y que hayan promediado 70 puntos o más durante el ciclo escolar 2023'));

  //ACTIVIDADES NOVIEMBRE
  meetings.add(Appointment(startTime: DateTime(2023,11,03,8,0), endTime: DateTime(2023,11,03,12,0), subject: 'Entrega de titulos', color: Colors.blueAccent, notes: 'Acto de entrega de titulos y diplomas de la Promoción 2023. Lugar: La misión, dirección: 4ta avenida final Lote No. 89, antigua carretera a Mixco, San Lucas Sacatepéquez.'));
  meetings.add(Appointment(startTime: DateTime(2023,11,06,8,0), endTime: DateTime(2023,11,06,11,0), subject: 'Primera semana de adaptación', color: Colors.brown, notes: 'Primera semana de adaptación para alumnos de nuevo ingreso de Preprimaria y Primero primaria para el ciclo 2024', recurrenceRule: 'FREQ=DAILY;COUNT=5'));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Appointment> source){
    appointments = source;
  }
}

void calendarTapped(CalendarTapDetails details) {
  Intl.defaultLocale = "es"; 
  if (details.targetElement == CalendarElement.appointment ||
      details.targetElement == CalendarElement.agenda) {
    final Appointment appointmentDetails = details.appointments![0];
    var subjectText = appointmentDetails.subject;
    var notes = appointmentDetails.notes;
    var dateText = DateFormat('MMMM dd, yyyy').format(appointmentDetails.startTime).toString();
    var startTimeText =
        DateFormat('hh:mm a').format(appointmentDetails.startTime).toString();
    var endTimeText =
        DateFormat('hh:mm a').format(appointmentDetails.endTime).toString();
    var _timeDetails;
    if (appointmentDetails.isAllDay) {
      _timeDetails = 'All day';
    } else {
      _timeDetails = '\n\nHora Inicio: $startTimeText \n\nHora Final: $endTimeText';
    }
    
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: contextG,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text("Información Evento"),
            content: Text('ASUNTO: $subjectText \n\nDESCRIPCIÓN: $notes \n\nFECHA: $dateText \n\n$_timeDetails'),
            actions: [
              CupertinoDialogAction(
                child: const Text("Ok"),
                onPressed: () { Navigator.of(context).pop();},
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: contextG,
        builder: (context) {
          return AlertDialog(
            title: const Text("Información"),
            content: Text('ASUNTO: $subjectText \n\nDESCRIPCIÓN: $notes \n\nFECHA: $dateText \n\n$_timeDetails'),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {Navigator.of(context).pop();},
              ),
            ],
            elevation: 24,
          );
        },
      );
    }
  }
}