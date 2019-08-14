import 'package:flutter/material.dart';
import 'package:whatsappclone/whatsapphome.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

Future<Null> main() async{
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xff075E54), accentColor: Color(0xff25D366)),
      title: "WhatsApp",
      home: WhatsAppHome(cameras),
      debugShowCheckedModeBanner: false,
    );
  }
}
