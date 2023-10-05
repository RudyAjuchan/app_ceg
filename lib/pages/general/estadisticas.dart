import 'package:asistencia_ceg/pages/dashboard/navbar.dart';
import 'package:asistencia_ceg/utils/global.colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Estadisticas extends StatelessWidget {
  Estadisticas({ Key? key }) : super(key: key);
  final List<DataCircle> _dataCircle = [
    DataCircle('Asistencias', '80', Colors.green as String?),
  ];

  Map<int, DataCircle> getSections() => _dataCircle
  .asMap()
  ;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text('Estadísticas de asistencia'),
        backgroundColor: GlobalColors.colorPrincipal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: PieChart(
          PieChartData(
            sections: getSections();
          )
        ),
      ),
    );
  }
}

class DataCircle {
  String? nombre;
  String? porcentaje;
  String? color;

  DataCircle(this.nombre, this.porcentaje, this.color);
}