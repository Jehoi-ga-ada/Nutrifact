import 'package:flutter/material.dart';
import 'package:nutrifact/screens/profile_form.dart';
import 'package:nutrifact/screens/profile_form1.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileForm(),
    );
  }
}