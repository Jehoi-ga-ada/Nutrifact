import 'dart:io';
import 'package:nutrifact/screens/preview_screen.dart';
import 'package:nutrifact/screens/sidebar.dart';
import 'package:camera/camera.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:media_scanner/media_scanner.dart';
import 'package:nutrifact/screens/summary_screen.dart';
import 'package:nutrifact/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const HomeScreen({super.key, required this.cameras});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CameraController cameraController;
  late Future<void> cameraValue;
  List<File> imagesList = [];
  bool isFlashOn = false;
  bool isRearCamera = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool nutritionLabelConfirmed = false;
  bool ingredientsLabelConfirmed = false;

  Future<File> saveImage(XFile image) async {
    final downloadPath = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_PICTURES);
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpeg';
    final file = File('$downloadPath/$fileName');

    try{
      await file.writeAsBytes(await image.readAsBytes());
    } catch (_) {}

    return file;
  }

  void takePicture() async {
    XFile? image;

    if(cameraController.value.isTakingPicture || !cameraController.value.isInitialized){
      return;
    }
    if(!isFlashOn){
      await cameraController.setFlashMode(FlashMode.off);
    } else {
      await cameraController.setFlashMode(FlashMode.torch);
    }
    image = await cameraController.takePicture();
    if(cameraController.value.flashMode == FlashMode.torch){
      setState(() {
        cameraController.setFlashMode(FlashMode.off);
      });
    }

    final file = await saveImage(image);

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(
            imageFile: file,
            onConfirm: () async {
              if (!nutritionLabelConfirmed) {
                setState(() {
                  nutritionLabelConfirmed = true;
                  imagesList.add(file);
                });
                Navigator.pop(context);
              } else if (!ingredientsLabelConfirmed) {
                setState(() {
                  ingredientsLabelConfirmed = true;
                  imagesList.add(file);
                });
                
                await ApiService.sendMessage(
                  message: 'Hello! can you tell me what picture this is',
                  modelId: 'gpt-4o',
                  imagesList: imagesList
                );
                
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const SummaryScreen(),
                  ),
                );
                setState(() {
                  nutritionLabelConfirmed = false;
                  ingredientsLabelConfirmed = false;
                  imagesList.clear();
                });
              }
            },
          ),
        ),
      );
    }

    MediaScanner.loadMedia(path: file.path);
  }

  void startCamera(int camera){
    cameraController = CameraController(
      widget.cameras[camera], 
      ResolutionPreset.high, 
      enableAudio: false
    );
    cameraValue = cameraController.initialize();
  }

  @override
  void initState() {
    startCamera(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      key: _key,
      drawer: const SideBar(),

      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: 0.05 * height
        ), // Adjust the bottom padding here
        child: SizedBox(
          height: 75,
          width: 75,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            shape: const CircleBorder(),
            onPressed: takePicture,
            child: Image.asset(
              'assets/home_screen/capture_button.png'
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: Stack(
        children: [
          FutureBuilder(future: cameraValue, builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return SizedBox(
                  width: size.width,
                  height: size.height,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: 100,
                      child: CameraPreview(cameraController),  
                    ),
                  ),
                );
              }
              else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          ),

          // Dark filter for camera 
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Container(
                color: const Color(0xFF000000),
              ),
            ),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 0.15 * height),
                child: nutritionLabelConfirmed? 
                Image.asset(
                  'assets/home_screen/photo_ing_ins.png',
                  height: 68,
                  width: 293,
                )
                : Image.asset(
                  'assets/home_screen/photo_ins.png',
                  height: 68,
                  width: 293,
                )
              ),
            ),
          ),

          // Flash Icon
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 0.03*width, top:0.02*height),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isFlashOn = !isFlashOn;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: isFlashOn 
                          ? Image.asset(
                            'assets/home_screen/flash_on.png',
                            height: 30,
                            width: 30,
                          )
                          : Image.asset(
                            'assets/home_screen/flash_off.png',
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

          // Burger Icon
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 0.03*width, top:0.02*height),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => _key.currentState!.openDrawer(),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/home_screen/burger.png',
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

          // Image Icon
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 0.6*width, 
                  bottom:0.08*height
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/home_screen/image.png',
                          width: 30,
                          height: 30,  
                        ),
                      )
                    ),
                  ],
                ),
              )
            ),
          ),

          // History Icon
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 0.6*width, 
                  bottom:0.08*height
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/home_screen/history.png',
                          height: 31,
                          width: 32,
                        ),
                      )
                    ),
                  ],
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}