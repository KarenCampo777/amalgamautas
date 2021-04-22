import 'package:amalgamautas/home_page/home.dart';
import 'package:amalgamautas/initial_page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: _initialization,
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Text('Error');
        }
        if(snapshot.connectionState == ConnectionState.done){
          return MaterialApp(
            title: 'Amalgamautas',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges() , builder: (context, snapshot){
              if(snapshot.data == null){
                return LoginPage();
              }else{
                return Home();
              }
            }),
          );
        }
        return CircularProgressIndicator();
      }
    );
  }
}


