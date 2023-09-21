import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Inicio de sesión google
  signInwithGoogle() async{
    //inicio de la interacción del inicio de sesión
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtenemos autenticación
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //crear una nueva credencial para el usuario
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}