import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  AuthService() {
    _googleSignIn.initialize(
      serverClientId:
      "121814287537-91g6na6g1rpdrq1qg1h37cm88ge6aqcu.apps.googleusercontent.com",
    );
  }


  Future<User?> signInWithGoogle() async {
    try {

      final GoogleSignInAccount account =
      await _googleSignIn.authenticate();


      final GoogleSignInAuthentication googleAuth =
          account.authentication;


      final credential =
      GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );


      final UserCredential result =
      await _auth.signInWithCredential(
        credential,
      );


      return result.user;


    } catch (e) {

      print("Google Sign In Error: $e");

      throw Exception(
        "Google Sign In Failed: $e",
      );
    }
  }


  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}