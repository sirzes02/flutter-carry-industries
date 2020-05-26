import 'package:flutter/material.dart';
import 'package:appcarro/login.dart';
import 'package:appcarro/colores.dart';
import 'package:appcarro/Ppregunta.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
       // scaffoldBackgroundColor: const Color(0xFFF5D770),
        //brightness: Brightness.dark,
        primarySwatch: colorCustom,
      ),
      home:Login(),
    );
  }
}