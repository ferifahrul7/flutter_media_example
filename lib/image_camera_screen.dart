import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';

import 'package:path/path.dart' as path;

class ImageCameraScreen extends StatefulWidget {
  const ImageCameraScreen({Key? key}) : super(key: key);

  @override
  State<ImageCameraScreen> createState() => _ImageCameraScreenState();
}

class _ImageCameraScreenState extends State<ImageCameraScreen> {
  File? _imageCamera;

  ImagePicker picker = ImagePicker();
  XFile? pickedFile;

  // This funcion will helps you to pick and Image from Camera
  _pickImageFromCamera() async {
    pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    if (pickedFile != null) {
      File image = File(pickedFile!.path);

      setState(() {
        _imageCamera = image;
      });
    }
  }

  _saveImageToGallery() {
    String fileDir = path.dirname(pickedFile!.path);
    var dt = DateTime.now();
    var bulan;
    if (dt.month < 10) {
      bulan = '0' + dt.month.toString();
    } else {
      bulan = dt.month;
    }
    var hari;
    if (dt.day < 10) {
      hari = '0' + dt.day.toString();
    } else {
      hari = dt.day;
    }
    var jam;
    if (dt.hour < 10) {
      jam = '0' + dt.hour.toString();
    } else {
      jam = dt.hour;
    }
    var menit;
    if (dt.minute < 10) {
      menit = '0' + dt.minute.toString();
    } else {
      menit = dt.minute;
    }
    var detik;
    if (dt.second < 10) {
      detik = '0' + dt.second.toString();
    } else {
      detik = dt.second;
    }
    String newPath = path.join(
        fileDir, 'img_cmr_${dt.year}$bulan${hari}_$jam$menit$detik.jpg');
    File image = File(pickedFile!.path).renameSync(newPath);
    if (pickedFile != null && image.path != null) {
      GallerySaver.saveImage(image.path, albumName: "Media").then((success) {});
    }
    const snackBar = SnackBar(
      content: Text('Image saved to Gallery'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mengambil gambar dengan kamera, disimpan"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  if (_imageCamera != null)
                    Image.file(_imageCamera!)
                  else
                    Text(
                      "Click on Pick Image to take picture from Camera",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      _pickImageFromCamera();
                    },
                    child: Text("Pick Image From Camera"),
                  ),
                  if (_imageCamera != null)
                    ElevatedButton(
                      onPressed: () {
                        _saveImageToGallery();
                      },
                      child: Text("Save Image to Gallery"),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
