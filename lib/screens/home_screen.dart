import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("NUTRIFACT"),
        ),
        backgroundColor: const Color.fromRGBO(255, 99, 0, 1),
      ),
      body: const Center(
        child: Text("Welcome to Nutrifact!"), 
      ),
    );
  }
}