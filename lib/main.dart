import 'package:flutter/material.dart';
import 'package:myapps/test.dart';
import 'package:myapps/ui/homepage/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color.fromARGB(255, 224, 17, 190),
      ),
      home: HomePage(),
    );
  }
}
