import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_2/registerpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<SharedPreferences> _myPref = SharedPreferences.getInstance();

  final String usernameDB = "mobile";
  final String passwordDB = "mobile_e";

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    _processLogin();
                  },
                  child: Text("Login"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterPage())
                  );
                },
                child: Text("Register"),
              )
            ],
          ),
        )
    );
  }

  void _processLogin() async {
    String currentUsername = _usernameController.value.text;
    String currentPassword = _passwordController.value.text;

    if (currentUsername == usernameDB && currentPassword == passwordDB) {
      SharedPreferences getPref = await _myPref;
      await getPref.setBool("loginStatus", true);
    }

  }

}


// void _processLogout() async{
//   SharedPreferences getPref = await _myPref;
//   await getPref.setBool("loginStatus", false);
// }

// void _processCheck() async{
//   SharedPreferences getPref = await _myPref;
//   bool status = getPref.getBool("loginStatus") ?? false;
//   _showToast("Current Status : {$status}", duration: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
// }
//
// void _showToast(String msg, {Toast? duration, ToastGravity? gravity}){
//   Fluttertoast.showToast(msg: msg, toastLength: duration, gravity: gravity);
// }

