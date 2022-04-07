import 'package:flutter/material.dart';
import 'package:restaurant_recipe/pages/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Manrope',
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
    );
  }
}