import 'package:flutter/material.dart';
import 'package:tugas_2/model/uname_list_model.dart';
import 'package:tugas_2/model/password_list_model.dart';
import 'homepage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  initiateLocalDB();
  runApp(const MyApp());
}

void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UnameListModelAdapter());
  await Hive.openBox<UnameListModel>("uname_list");
  Hive.registerAdapter(PasswordListModelAdapter());
  await Hive.openBox<PasswordListModel>("password_list");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage()
    );
  }
}