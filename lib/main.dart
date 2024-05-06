import 'package:flutter/material.dart';
import 'package:nutrifact/screens/home_screen.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:nutrifact/screens/splash_screen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}