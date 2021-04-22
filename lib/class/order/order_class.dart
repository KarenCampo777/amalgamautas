import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderClass {
  Future<String?> createOrder({required Map<String, dynamic> dataOrder}) async {
    String? idUser = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('users').doc(idUser).collection('orders')
        .add(dataOrder)
        .then((value) => 'Order create ')
        .catchError((error) => error.toString());
  }
}
