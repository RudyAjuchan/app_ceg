import 'package:asistencia_ceg/pages/dashboard/navbar.dart';
import 'package:asistencia_ceg/utils/global.colors.dart';
import 'package:flutter/material.dart';

class Reporte extends StatelessWidget {
 Reporte({ Key? key }) : super(key: key);
  final List<Asistencia> _asistencia = [
    Asistencia('Rudy Ajuchán', 'entrada', 'Martes 6 Junio 2023', '06:58:04'),
    Asistencia('Rudy Ajuchán', 'salida', 'Martes 6 Junio 2023', '06:58:04'),
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text('Reporte asistencia'),
        backgroundColor: GlobalColors.colorPrincipal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: _asistencia.length,
          itemBuilder: (context, index){
            if(_asistencia[index].tipo.toString()=="entrada"){
              return ListTile(
              title: Text(_asistencia[index].fecha.toString()),
              subtitle: Text('${_asistencia[index].alumno} ha marcado la ${_asistencia[index].tipo} a las ${_asistencia[index].hora}hrs'),
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text(_asistencia[index].tipo!.substring(0,1).toUpperCase()),
              ),
            );
            }else{
              return ListTile(
              title: Text(_asistencia[index].fecha.toString()),
              subtitle: Text('${_asistencia[index].alumno} ha marcado la ${_asistencia[index].tipo} a las ${_asistencia[index].hora}hrs'),
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(_asistencia[index].tipo!.substring(0,1).toUpperCase()),
              ),
            );
            }
            
          }
        ),
      ),
    );
  }
}

class Asistencia {
  String? alumno;
  String? tipo;
  String? fecha;
  String? hora;

  Asistencia(this.alumno, this.tipo, this.fecha, this.hora);
}