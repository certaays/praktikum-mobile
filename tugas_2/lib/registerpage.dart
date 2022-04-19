import 'package:flutter/material.dart';
import 'package:tugas_2/model/uname_list_model.dart';
import 'package:tugas_2/model/password_list_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Box<UnameListModel> unameDB = Hive.box<UnameListModel>("uname_list");
  Box<PasswordListModel> passwordDB = Hive.box<PasswordListModel>("password_list");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Praktikum Mobile"),
        ),
        body:
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      hintText: "Username"
                  )
              ),
              TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      hintText: "Password"
                  )
              ),
              ElevatedButton(
                onPressed: () {
                  _processRegist();
                },
                child: Text("Register"),
              )
            ],
          ),
        )
    );
  }

  void _processRegist(){
    if(_usernameController.text.isNotEmpty){
      unameDB.add(UnameListModel(uname: _usernameController.text));
      _usernameController.clear();
      setState(() {});
    }
    if(_passwordController.text.isNotEmpty){
      passwordDB.add(PasswordListModel(password: _passwordController.text));
      _passwordController.clear();
      setState(() {});
    }
  }

}
