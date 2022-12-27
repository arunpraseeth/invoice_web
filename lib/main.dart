import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:invoice_web/auth/login.dart';
import 'package:invoice_web/utils/constants.dart';
import 'package:invoice_web/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAMmlPaoEAEGGsWxudIZwYHqxqzmW0PS28",
      projectId: "invoice-f3d65",
      messagingSenderId: "570465555594",
      appId: "1:570465555594:web:287ec2acc4a2577ed80973",
    ),
  );
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
