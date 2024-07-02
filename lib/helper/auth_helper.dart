import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  // SIGN IN WITH GOOGLE
  Future<void> signInWithEmail(
      {required String email, required String password}) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // SIGN OUT
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

}
