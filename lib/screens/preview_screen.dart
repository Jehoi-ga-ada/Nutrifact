import 'dart:io';
import 'package:flutter/material.dart';

class PreviewScreen extends StatefulWidget {
  final File imageFile;
  final Function? onConfirm;

  const PreviewScreen({
    super.key, 
    required this.imageFile,
    this.onConfirm,
  });

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: 0.05 * height,
        ),
        child: SizedBox(
          height: 75,
          width: 75,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            shape: const CircleBorder(),
            onPressed: () {
              if (widget.onConfirm!=null){
                widget.onConfirm!();
              }
            },
            child: Image.asset(
              'assets/preview_screen/ok_button.png'
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,


      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.file(
            widget.imageFile,
            fit: BoxFit.cover,
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 0.03*width, top:0.02*height),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/preview_screen/back_button.png',
                          height: 30,
                          width: 30,
                        ),
                      )
                    ),
                  ],
                ),
              )
            ),
          ),
        ]
      ),
    );
  }
}
