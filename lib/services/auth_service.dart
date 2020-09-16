import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<User> loginWithEmail({String email, String password}) async {
    try {
      final res = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return res.user;
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  static Future<User> signUpWithEmail({String email, String password}) async {
    try {
      final res = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return res.user;
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  static Future<User> signInWithGoogle() async {
    try {
      GoogleSignIn gs = GoogleSignIn();
      final googleUser = await gs.signIn();
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final res = await _auth.signInWithCredential(credential);
      return res.user;
    } catch (e) {
      print(e.message);
      return null;
    }
  }
}
