import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GraficaCircular extends StatelessWidget {
GraficaCircular({ Key? key }) : super(key: key);
  List<DataCircle> _datasC = [];

    Future<List<DataCircle>> getData() async{
    final user = FirebaseAuth.instance.currentUser!;
    String email = user.email!;
    var url = Uri.parse('https://apiceg.juliojodi.com/apiCEG/estadisticaAsistencia');
    final response = await http.post(url, body: {'correo': email});
    List<DataCircle> _data = [];
    if(response.statusCode==200){
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      var cont=1;
      for(var item in jsonData){
        _data.add(
          DataCircle(item['nombre'], double.parse(item['porcentaje'].toString()), cont==1 ? Colors.green : cont==2 ? Colors.red : Colors.teal),
        );
        cont++;
      }
      _datasC = _data;
      return _data;
    }else{
      throw Exception("Falló la petición");
    }
  }

  @override
  Widget build(BuildContext context){
    Future<List<DataCircle>> _dataCircle = getData();

  List<PieChartSectionData> getSections() {
    double? porcentaje1;
    double? porcentaje2;
    double? porcentaje3;
    var h=1;
    _datasC.forEach((element) { 
      if(h==1){
        porcentaje1 = element.porcentaje;
      }else if(h==2){
        porcentaje2 = element.porcentaje;
      }else if(h==3){
        porcentaje3 = element.porcentaje;
      }
      h++;    
    });
    /*  _dataCircle.then((value) => {
          porcentaje1 = double.parse(value[0].porcentaje.toString()),
          porcentaje2 = double.parse(value[1].porcentaje.toString()),
          porcentaje3 = double.parse(value[2].porcentaje.toString()),
        }); */
    return List.generate(3, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: porcentaje1,
            title: "$porcentaje1%",
            titleStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: porcentaje2,
            title: "$porcentaje2%",
            titleStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.teal,
            value: porcentaje3,
            title: "$porcentaje3%",
            titleStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          );
        default:
          throw Error();
      }
    });
  }

    return FutureBuilder(
      future: _dataCircle, 
      builder: (context, snapshot){
        if(snapshot.hasData){
          /* snapshot.data!.forEach((element) {
            print(element.nombre);
          }); */
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
                              _datasC
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

      return const Center(
            child: CircularProgressIndicator(),
          );
    });
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

