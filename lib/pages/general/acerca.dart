import 'package:asistencia_ceg/consts.dart';
import 'package:asistencia_ceg/pages/dashboard/navbar.dart';
import 'package:asistencia_ceg/utils/global.colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Acerca extends StatelessWidget {
const Acerca({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text('Acerca de la aplicación'),
        backgroundColor: GlobalColors.colorPrincipal,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40,),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset(image5, width: 150,),
            )
          ),
          const SizedBox(height: 20,),
          const Center(
            child: Text("CEG App",style: TextStyle(fontSize: 17),),
          ),
          const Center(
            child: Text("1.0.0",style: TextStyle(fontSize: 15, color: Colors.grey),),
          ),
          const SizedBox(height: 40,),
          const Divider(),
          const ListTile(
              title: Text("Enviar comentarios"),
              subtitle: Text("rajuchan@cegetsemani.edu.gt"),
            ),
          ListTile(
              title: const Text("Desarrollador"),
              subtitle: const Text("Rudy Ajuchán" , style: TextStyle(decoration: TextDecoration.underline)),
              onTap: () => {_launchUrl()}
            ),
          const ListTile(
              title: Text("Atribuciones"),
              subtitle: Text(
                "Google iconos creados por Freepik - Flaticon \nBotón de inicio iconos creados por Shastry \nLista de verificación iconos creados por Freepik \nCerrar sesión iconos creados por Pixel perfect \nNuevo email iconos creados por Freepik \nNotificación iconos creados por JessHG \nAtención al cliente iconos creados por Freepik \nTodos obtenidos de Flaticon"
              ),
            ),
        ],
      ),
    );
  }
}

Future<void> _launchUrl() async {
  final Uri nativeUrl = Uri.parse('instagram://user?username=ajuchanrudy');
  final Uri webUrl = Uri.parse('https://www.instagram.com/ajuchanrudy/');
  if (await canLaunchUrl(nativeUrl)) {
    await launchUrl(nativeUrl);
  } else if (await launchUrl(webUrl)) {
    await launchUrl(webUrl);
  } else {
    print("can't open Instagram");
  }
}