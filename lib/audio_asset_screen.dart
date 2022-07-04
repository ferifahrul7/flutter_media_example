import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioAssetScreen extends StatefulWidget {
  const AudioAssetScreen({Key? key}) : super(key: key);

  @override
  State<AudioAssetScreen> createState() => _AudioAssetScreenState();
}

class _AudioAssetScreenState extends State<AudioAssetScreen> {
  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Memainkan Audio"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Play Musik",
              ),
              Image(image: AssetImage("assets/musik.jpg")),
              ElevatedButton(
                child: Text(
                  'Play',
                ),
                onPressed: () async {
                  await player.play(AssetSource('Turip.mp3'));
                },
              ),
              ElevatedButton(
                child: Text(
                  'Pause',
                ),
                onPressed: () async {
                  await player.pause();
                },
              ),
              ElevatedButton(
                child: Text(
                  'Resume',
                ),
                onPressed: () async {
                  await player.resume();
                },
              ),
              ElevatedButton(
                child: Text(
                  'Stop',
                ),
                onPressed: () async {
                  await player.stop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
