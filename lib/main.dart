import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:nutrifact/screens/home_screen.dart';
import 'package:nutrifact/screens/profile.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:nutrifact/screens/splash_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras,));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(
      //   cameras: cameras,
      // ),
      home: ProfileScreen(
      ),
    );
  }
}