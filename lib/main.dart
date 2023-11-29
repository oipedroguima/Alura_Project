import 'package:flutter/material.dart';
import 'package:flutter_1/navigator/Inherited.dart';
import 'package:flutter_1/screen/Form_Screen.dart';
import 'package:flutter_1/screen/Home_Screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskInherited(child: HomeScreen()),
    );
  }
}











