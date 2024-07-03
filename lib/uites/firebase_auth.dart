import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whatsapp/widgets/main_screen.dart';

class FirebaseAuthScreen {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String messages = '';
  Future<User?> createAccount({
    required BuildContext context,
    required String email,
    required String pass,
  }) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        // instantiated earlier on: final _firebaseAuth = FirebaseAuth.instance;
        email: email,
        password: pass,
      );

      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        messages = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        messages = 'An account already exists with that email.';
      }
      Fluttertoast.showToast(
        msg: "Failed: ${e.message}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
        msg: "Failed: $e",
      );
    }
    return null;
  }

  Future<UserCredential?> signin({
    required BuildContext context,
    required String email,
    required String pass,
  }) async {
    try {
      return await auth.signInWithEmailAndPassword(
          email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        messages = 'Invalid login credentials.';
      } else {
        messages = e.code;
      }
      Fluttertoast.showToast(
        msg: messages,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }

    return null;
  }
}
