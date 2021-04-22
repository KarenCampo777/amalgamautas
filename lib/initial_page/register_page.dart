import 'package:amalgamautas/class/register/register_login_class.dart';
import 'package:amalgamautas/initial_page/input_widget.dart';
import 'package:amalgamautas/model/register_model.dart';
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
  RegisterLoginClass registerClass = RegisterLoginClass();

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
                ElevatedButton(onPressed: () {
                  registerClass.createUser(email: email.text, password: password.text).then((value){
                    if(value.isEmpty){
                      print('Procesando registro');
                    }else{
                      print(value);
                      registerClass.addUser(userUid: value, dataUser: ModelData(
                        govId: value,
                        company: company.text,
                        email: email.text,
                        lastName: lastName.text,
                        name: name.text
                      ).jsonData()).then((value) => print(value));
                      Navigator.of(context).pop();
                    }
                  });
                }, child: Text('Guardar datos'))
              ],
            )),
      ),
    );
  }
}
