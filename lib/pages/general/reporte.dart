import 'dart:convert';

import 'package:asistencia_ceg/pages/dashboard/navbar.dart';
import 'package:asistencia_ceg/utils/global.colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Reporte extends StatelessWidget {
const Reporte({ Key? key }) : super(key: key);

  Future<List<Reportes>> getReporte() async{
    final user = FirebaseAuth.instance.currentUser!;
    String email = user.email!;
    var url = Uri.parse('https://apiceg.juliojodi.com/apiCEG/listarAsistencias');
    final response = await http.post(url, body: {'correo': email});
    List<Reportes> _reporte = [];
    if(response.statusCode==200){
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);      
      for(var item in jsonData){
        _reporte.add(
          Reportes(item['nombres']+', '+item['apellidos'], item['tipo'], item['fecha'], item['hora']),
        );
      }
      return _reporte;
    }else{
      throw Exception("Falló la petición");
    }
  }
  @override
  Widget build(BuildContext context){
    Future<List<Reportes>> reporte = getReporte();
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text('Reporte asistencia'),
        backgroundColor: GlobalColors.colorPrincipal,
      ),
      body: FutureBuilder(
          future: reporte, 
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                    if(snapshot.data![index].tipo.toString()=="entrada"){
                      return ListTile(
                      title: Text(snapshot.data![index].fecha.toString()),
                      subtitle: Text('${snapshot.data![index].alumno} ha marcado la ${snapshot.data![index].tipo} a las ${snapshot.data![index].hora}hrs'),
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text(snapshot.data![index].tipo!.substring(0,1).toUpperCase()),
                      ),
                    );
                    }else{
                      return ListTile(
                      title: Text(snapshot.data![index].fecha.toString()),
                      subtitle: Text('${snapshot.data![index].alumno} ha marcado la ${snapshot.data![index].tipo} a las ${snapshot.data![index].hora}hrs'),
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Text(snapshot.data![index].tipo!.substring(0,1).toUpperCase()),
                      ),
                    );
                    }
                    
                  }
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        ),
    );
  }
}

class Reportes {
  String? alumno;
  String? tipo;
  String? fecha;
  String? hora;

  Reportes(this.alumno, this.tipo, this.fecha, this.hora);
}