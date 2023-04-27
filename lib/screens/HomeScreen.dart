import 'package:camera/camera.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../components/TakePictureButton.dart';
import '../styles/app_style.dart';
import 'ResultScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool cameraInitialized = false;
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    // ignore: no_leading_underscores_for_local_identifiers
    _initializeControllerFuture();
  }

  Future<void>? _initializeControllerFuture() async {
    var cameras = await availableCameras();
    var camera = cameras.first;
    controller = CameraController(camera, ResolutionPreset.max);
    try {
      await controller.initialize();
      setState(() {
        cameraInitialized = true;
      });
    } catch (e) {
      print("Error while initalize camra");
    }
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print("cONTROLLER INIT: " + controller.value.isInitialized.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "TT OCR",
          style: AppStyles.titleText,
        ),
        centerTitle: true,
      ),
      body: Center(
          child: cameraInitialized
              ? CameraPreview(controller)
              : const CircularProgressIndicator()),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          top: 4,
        ),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            spreadRadius: 1,
          )
        ]),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 40,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TakePictureButton(
                onTap: () async {
                  var image = await controller.takePicture();
                  print("File get: " + image.path);
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResultScreen(
                            imagePath: image.path,
                          )));
                },
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    fixedSize: Size(40, 40),
                    shape: CircleBorder(),
                  ),
                  onPressed: () async {
                    final _picker = ImagePicker();
                    final image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    print("File get: " + image!.path);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ResultScreen(
                              imagePath: image.path,
                            )));
                  },
                  child: const Icon(
                    Icons.image_outlined,
                    color: Colors.grey,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
