import 'dart:convert';

import 'package:asistencia_ceg/pages/dashboard/navbar.dart';
import 'package:asistencia_ceg/utils/global.colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Notificaciones extends StatelessWidget {
const Notificaciones({ Key? key }) : super(key: key);

  Future<List<Notificacion>> getNotificacion() async{
    final user = FirebaseAuth.instance.currentUser!;
    String email = user.email!;
    var url = Uri.parse('https://apiceg.juliojodi.com/apiCEG/listarNotificaciones');
    final response = await http.post(url, body: {'correo': email});
    List<Notificacion> _notificacion = [];
    if(response.statusCode==200){
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);      
      for(var item in jsonData){
        _notificacion.add(
          Notificacion(item['nombres']+', '+item['apellidos'], item['asunto'], item['fecha'], item['hora'], item['mensaje']),
        );
      }
      return _notificacion;
    }else{
      throw Exception("Falló la petición");
    }
  }

  @override
  Widget build(BuildContext context){
    Future<List<Notificacion>> notificacion = getNotificacion();
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text('Notificaciones'),
        backgroundColor: GlobalColors.colorPrincipal,
      ),
      body: FutureBuilder(
          future: notificacion, 
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                      return ListTile(
                      title: Text(snapshot.data![index].asunto.toString()),
                      subtitle: Text('Notificación acerca de: ${snapshot.data![index].alumno}. \n\nMensaje: ${snapshot.data![index].mensaje} \n\nFecha generado notificación: ${snapshot.data![index].fecha}hrs'),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(snapshot.data![index].asunto!.substring(0,1).toUpperCase()),
                      ),
                    );
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

class Notificacion {
  String? alumno;
  String? asunto;
  String? fecha;
  String? hora;
  String? mensaje;

  Notificacion(this.alumno, this.asunto, this.fecha, this.hora, this.mensaje);
}