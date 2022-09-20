import 'package:flutter/material.dart';
import 'package:flutter_php/drawer.dart';
import 'package:flutter_php/homepage.dart';
import 'package:flutter_php/login1.dart';
import 'package:flutter_php/pdf.dart';
import 'package:flutter_php/register.dart';

import 'forgot_password.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  // void initState() {
  //   getadata();
  // }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: Scaffold(
            // appBar: AppBar(
            //   title: Text("Flutter And Php"),
            // ),
            body: homepage()));
  }
}