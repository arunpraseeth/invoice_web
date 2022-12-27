import 'package:flutter/material.dart';
import 'package:invoice_web/auth/login.dart';
import 'package:invoice_web/utils/constants.dart';
import 'package:invoice_web/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(Colors.black),
      ),
      // home: const HomePage(),
      home: const LoginPage(),
    );
  }
}
