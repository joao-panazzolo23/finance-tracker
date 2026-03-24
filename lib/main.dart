import 'package:flutter/material.dart';

///Equivalent to .NET's Program.cs
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
