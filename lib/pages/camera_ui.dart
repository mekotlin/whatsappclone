import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraUI extends StatefulWidget {
  List<CameraDescription> camers;

  CameraUI(this.camers);

  @override
  _CameraUIState createState() => _CameraUIState();
}

class _CameraUIState extends State<CameraUI> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.camers[0], ResolutionPreset.high);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }
}
