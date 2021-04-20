import 'package:amalgamautas/initial_page/input_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController company = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: form,
            child: Column(
              children: [
                InputWidget(
                  inputString: 'Nombre',
                  input: name,
                ),
                InputWidget(
                  inputString: 'Apellido',
                  input: lastName,
                ),
                InputWidget(
                  inputString: 'Email',
                  input: email,
                ),
                InputWidget(
                  inputString: 'Compania',
                  input: company,
                ),
                InputWidget(
                  inputString: 'Contrasena',
                  input: password,
                ),
                ElevatedButton(onPressed: () {}, child: Text('Guardar datos'))
              ],
            )),
      ),
    );
  }
}
