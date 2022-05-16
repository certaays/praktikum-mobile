import 'package:flutter/material.dart';
import 'package:latres/user.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 17, 23, 1),
      appBar: AppBar(
        title: Text("Github Search"),
        backgroundColor: Color.fromRGBO(33, 38, 45, 1),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Row(
          children: [
            Flexible(
              child: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: myController,
                  style: TextStyle(
                    color: Colors.white70
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(33, 38, 45, 1),
                    contentPadding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white, width: 0.1)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color.fromRGBO(35, 41, 47, 1))
                    ),
                    hintText: 'Search Username',
                    hintStyle: TextStyle(color: Colors.white70)
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfileUser(username: myController.text,);
                }));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
                child: Icon(
                  Icons.search,
                  color: Colors.white70,
                  size: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
