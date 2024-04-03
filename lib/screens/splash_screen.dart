import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:nutrifact/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
  with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (_) => const HomeScreen(),
    //     ),
    //   );
    // });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(254, 109, 2, 1),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image(
                  image: AssetImage('assets/splash_white_logo.png'),
                  width: 338,
                ),
                Text(
                  'NutriFact',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Mulish',
                  ),
                ),
              ],
            ),
            Text(
              'choose better, eat better',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Mulish',
                fontSize: 23,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(height: 70),
          ],  
        ),
      ),
    );
  }
}