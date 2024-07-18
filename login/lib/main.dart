import 'package:flutter/material.dart';
import 'package:login/inicio.dart';
import 'package:login/inicio_sesion.dart';
import 'package:login/registro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
                '/registro': (context) => RegistroPage(),
                '/inicio': (context) => InicioPage(),
                '/inicio_sesion': (context) => LoginPage(),
      },
    );
  }
}
