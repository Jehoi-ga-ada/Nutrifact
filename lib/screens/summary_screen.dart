import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Hello',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// YA MARI KITA COBA