import 'package:flutter/material.dart';
import 'package:win/pages/main_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.blueAccent),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
    },
  ));
}
