import 'package:amalgamautas/model/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderClass {

  String? idUser = FirebaseAuth.instance.currentUser!.uid;

  Future<String?> createOrder({required Map<String, dynamic> dataOrder}) async {

    return FirebaseFirestore.instance
        .collection('users')
        .doc(idUser)
        .collection('orders')
        .add(dataOrder)
        .then((value) => value.id)
        .catchError((error) => error.toString());
  }

  Future<String?> createShipping({required Map<String, dynamic> dataShipping, required String idOrder}) async {
    String? idUser = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(idUser)
        .collection('orders')
        .doc(idOrder)
        .collection('shipping')
        .add(dataShipping)
        .then((value) => 'Shipping create')
        .catchError((error) => error.toString());
  }

  Future<String?> createPayment({required Map<String, dynamic> dataPayment, required String idOrder}) async {
    String? idUser = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(idUser)
        .collection('orders')
        .doc(idOrder)
        .collection('payment')
        .add(dataPayment)
        .then((value) => 'Payment create')
        .catchError((error) => error.toString());
  }

  Stream<List<ModelDataOrder>> listOrders() {
    return FirebaseFirestore.instance
        .collection('users').doc(idUser).collection('orders')
        .snapshots()
        .map((event) => event.docs.map((e) => ModelDataOrder.fromJson(e.data())).toList());
  }
}
