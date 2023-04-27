import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todoapp/form_page.dart';
import 'package:hive_todoapp/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Box box = await Hive.openBox('Student_list');
  runApp(const MyApp());

  //box.put('name', 'David');

  // print('Name: ${box.get('name')}');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'hive_database',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          // scaffoldBackgroundColor: Color(0xF9F9F9),
          primarySwatch: Colors.blue,
        ),
        home: hiv_home_page());
    //home: form_page());
  }
}
