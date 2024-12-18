import 'package:flutter/material.dart';
import 'package:flutter_application_coba_capsten/User/Auth/login.dart';
import 'package:flutter_application_coba_capsten/Pengepul/UI/pengepul.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(), // Pastikan ini sesuai dengan nama halaman yang Anda inginkan
      debugShowCheckedModeBanner: false,
    );  
  }
}
