import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      final cameras = await availableCameras();
      controller = CameraController(
        cameras[0], // First camera
        ResolutionPreset.medium, // Use medium resolution to avoid issues
      );
      await controller.initialize();
      setState(() {}); // Refresh UI once initialized
    } catch (e) {
      debugPrint('Camera initialization error: $e');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(title: Text("Camera")),
        body: CameraPreview(controller),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: Text("Camera")),
        body: Center(child: CircularProgressIndicator()),
      );
    }
  }
}
