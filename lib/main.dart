import 'package:flutter/material.dart';
import 'package:tugas_pert_11/audio_asset_screen.dart';
import 'package:tugas_pert_11/image_camera_screen.dart';
import 'package:tugas_pert_11/image_gallery_screen.dart';
import 'package:tugas_pert_11/video_camera_screen.dart';
import 'package:tugas_pert_11/video_gallery_screen.dart';
import 'package:tugas_pert_11/video_youtube_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Pertemuan 11',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tugas Pertemuan 11'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: ListView(
            children: <Widget>[
              ListTile(
                title: Text("1. Memainkan file dari audio asset"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AudioAssetScreen()),
                ),
              ),
              ListTile(
                title: Text("2. Memainkan video dari youtube"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoYoutubeScreen()),
                ),
              ),
              ListTile(
                title: Text("3. mengambil gambar dari kamera, disimpan"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageCameraScreen()),
                ),
              ),
              ListTile(
                title: Text(
                    "4. mengambil gambar dari gallery, kemudian ditampilkan"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageGalleryScreen()),
                ),
              ),
              ListTile(
                title:
                    Text("5. mengambil video dari kamera, kemudian disimpan"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoCameraScreen()),
                ),
              ),
              ListTile(
                title: Text(
                    "6. mengambil video dari gallery, kemudian ditampilkan"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoGalleryScreen()),
                ),
              ),
            ],
          )),
    );
  }
}
