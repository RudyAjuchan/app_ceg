import 'package:asistencia_ceg/pages/Login/splash_view.dart';
import 'package:asistencia_ceg/pages/dashboard/dashboard.dart';
import 'package:asistencia_ceg/pages/general/acerca.dart';
import 'package:asistencia_ceg/pages/general/ayuda.dart';
import 'package:asistencia_ceg/pages/general/calendario.dart';
import 'package:asistencia_ceg/pages/general/estadisticas.dart';
import 'package:asistencia_ceg/pages/general/justificar.dart';
import 'package:asistencia_ceg/pages/general/notificaciones.dart';
import 'package:asistencia_ceg/pages/general/reporte.dart';
import 'package:asistencia_ceg/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:asistencia_ceg/consts.dart';
import 'package:asistencia_ceg/utils/global.colors.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class Navbar extends StatelessWidget {
  Navbar({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(user.displayName!=null ? user.displayName!: ''),
              accountEmail: Text(user.email!),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(child: Image.asset(avatarIcon)),
              ),
              decoration: BoxDecoration(
                color: GlobalColors.colorPrincipal,
                image: DecorationImage(
                  image: AssetImage(image4),
                  fit: BoxFit.cover,
                )
              ),
          ),
          ListTile(
            leading: Image.asset(homeIcon),
            title: const Text('Inicio'),
            onTap: () => {
              Get.to(const Dashboard()),
            },
          ),
          ListTile(
            leading: Image.asset(notificacionIcon),
            title: const Text('Notificaciones'),
            onTap: () => {
              Get.to(const Notificaciones()),
            },
          ),
          ListTile(
            leading: Image.asset(calendarioIcon),
            title: const Text('Calendario Escolar'),
            onTap: () => {
              Get.to(const Calendario()),
            },
          ),
          ListTile(
            leading: Image.asset(justificarIcon),
            title: const Text('Justificar Asistencia'),
            onTap: () => {
              Get.to(Justificar()),
            },
          ),
          ListTile(
            leading: Image.asset(asistenciaIcon),
            title: const Text('Reporte Asistencia'),
            onTap: () => {
              Get.to(const Reporte()),
            },
          ),
          ListTile(
            leading: Image.asset(estadisticaIcon),
            title: const Text('Estadisticas'),
            onTap: () => {
              Get.to(const Estadisticas()),
            },
          ),
          ListTile(
            leading: Image.asset(conversarIcon),
            title: const Text('Conversar (próximamente)'),
            onTap: () => {},
          ),
          ListTile(
            leading: Image.asset(appIcon),
            title: const Text('Acerca de la aplicación'),
            onTap: () => {
              Get.to(const Acerca()),
            },
          ),
          ListTile(
            leading: Image.asset(ayudaIcon),
            title: const Text('Ayuda'),
            onTap: () => {
              Get.to(const Ayuda()),
            },
          ),
          const Divider(),
          ListTile(
            leading: Image.asset(cerrarIcon),
            title: const Text('Cerrar Sesión'),
            onTap: () => AuthService().signOutGoogle().then((res){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const SplashView();
                            },
                          ),
                        );
                      }),
          ),
        ],
      ),
    );
  }
}
