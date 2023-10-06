import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraficaCircular extends StatelessWidget {
GraficaCircular({ Key? key }) : super(key: key);
  final List<DataCircle> _dataCircle = [
    DataCircle('Asistencias', 70, Colors.green),
    DataCircle('Inasistencias', 30, Colors.red),
    DataCircle('Inasistencias', 10, Colors.cyan.shade700),
  ];

  List<PieChartSectionData> getSections() => _dataCircle
  .asMap()
  .map<int, PieChartSectionData>((index, data){
    final value = PieChartSectionData(
      color: data.color,
      value: data.porcentaje,
      title: '${data.porcentaje}%',
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color:Color(0xffffffff),
      ),
    );

    return MapEntry(index, value);
  })
  .values
  .toList();

  @override
  Widget build(BuildContext context){
    return Card(
      child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Gráfica por tipo de asistencia", 
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: PieChart(
                  PieChartData(
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 0,
                    centerSpaceRadius: 80,
                    sections: getSections()
                  )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                        _dataCircle
                          .map(
                            (data) => Container(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: buildIndicator(color: data.color, text: data.nombre),
                            ),
                          )
                          .toList(),
                    ),
                    )
                ],
              )
            ],
          ),
    );
  }
}

class DataCircle {
  String? nombre;
  double? porcentaje;
  Color? color;

  DataCircle(this.nombre, this.porcentaje, this.color);
}

  Widget buildIndicator({
    Color? color,
    String? text
  }) => Row(
      children: <Widget>[
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 8,),
        Text(
          text!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff505050)
          ),
        )
      ],
    );