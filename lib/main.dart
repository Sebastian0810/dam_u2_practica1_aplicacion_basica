import 'package:dam_u2_practica1_aplicacion_basica/practica1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Práctica 1',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Practica1(),
    );
  }
}