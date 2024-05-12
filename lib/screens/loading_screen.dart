import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(  
      backgroundColor:const Color.fromRGBO(175, 177, 182, 1),
      body: Stack(
        children: [
          SafeArea(
            minimum: EdgeInsets.only(
              bottom: 0.07 * height,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/loading_screen/processing_image.png',
                height: 200,
                width: 200,
              ),
            ),
          ),

          SafeArea(
            minimum: EdgeInsets.only(
              bottom: 0.07 * height,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 0.25 * height, 
                ),
                child: const Text(
                  "Processing Image . . .",
                  style: TextStyle(
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}