import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Login Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: const FlutterLogo(
                size: 40,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 50, 40, 0),
              child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    hintText: 'Email',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  hintText: 'Password',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 25, 40, 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: (){}, // Respon ketika button ditekan
                child: Text("Log In"),
              )
            ),
            Container(
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.blueGrey,
                ),
                onPressed: (){}, // Respon ketika button ditekan
                child: Text("Forgot password?"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
