import 'package:flutter/material.dart';
import 'package:pdpui_intro/pages/home_page.dart';
import 'package:pdpui_intro/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroPage(),
      routes: {
        HomePage.id: (ctx) => const HomePage(),
        IntroPage.id: (ctx) => const IntroPage(),
      },
    );
  }
}
