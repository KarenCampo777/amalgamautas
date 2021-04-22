import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterLoginClass {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  CollectionReference reference = FirebaseFirestore.instance.collection('users');

  Future<String?> addUser({required String userUid, Map<String, String>? dataUser}) async {
    return reference.doc(userUid).set(dataUser!).then((value) => 'User add').catchError((error) => error.toString());
  }

  Future<String> createUser(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'El password es muy corto';
      } else if (e.code == 'email-already-in-use') {
        return 'El password actual ya esta en uso';
      }
    } catch (e) {
      return e.toString();
    }
    return '';
  }

  Future<String> loginUser({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'El usuarios no existe';
      } else if (e.code == 'wrong-password') {
        return 'El password actual es incorrecto';
      }
    } catch (e) {
      return e.toString();
    }
    return '';
  }
}
