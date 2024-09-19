import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playSound() async {
    await _audioPlayer.play(
      AssetSource('story 1.1.mp3'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sound'),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/bb.png',
            height: 200,
            width: 350,
          ),
          Image.asset(
            'assets/aa.png',
            height: 350,
            width: 350,
          ),
          ElevatedButton(
            onPressed: _playSound,
            child: Text('Click me'),
          ),
        ],
      ),
    );
  }
}
