import 'package:amalgamautas/class/register/register_login_class.dart';
import 'package:amalgamautas/home_page/home.dart';
import 'package:amalgamautas/initial_page/input_widget.dart';
import 'package:amalgamautas/initial_page/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> form = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RegisterLoginClass _registerClass = RegisterLoginClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: form,
          child: Column(
            children: [
              InputWidget(
                input: email,
                inputString: 'Email',
              ),
              InputWidget(
                input: password,
                inputString: 'Password',
              ),
              ElevatedButton(onPressed: () {
                _registerClass.loginUser(email: email.text, password: password.text).then((value){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Home()));
                });
              }, child: Text('Login')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
                  child: Text('Registrarse'))
            ],
          ),
        ),
      ),
    );
  }
}
