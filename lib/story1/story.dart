import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:short_stories/home.dart';
import 'package:short_stories/story1/lesson.dart';
import 'package:short_stories/story1/page1.dart';
import 'package:short_stories/story1/page2.dart';
import 'package:short_stories/story1/page3.dart';
import 'package:short_stories/story1/page4.dart';
import 'package:short_stories/story1/page5.dart';

class Story1 extends StatefulWidget {
  const Story1({super.key});

  @override
  State<Story1> createState() => _Story1State();
}

class _Story1State extends State<Story1> {
  final PageController _controller = PageController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  int num = 1;
  bool isLesson = false;
  bool isPaused = false;

  double _progressValue = 0.0;
  final int totalDurationInSeconds = 33; // Total duration for the progress bar
  Timer? _timer; // Make _timer nullable
  Duration _audioPosition = Duration.zero;
  Duration _audioDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _playSound();
    _startTimer();
  }

  void _startTimer() {
    if (_timer != null) return; // Prevent reinitialization

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _progressValue += 0.1 / totalDurationInSeconds; // Increment progress
        if (_progressValue >= 1.0) {
          _progressValue = 1.0;
          _timer?.cancel();
          _timer = null; // Set _timer to null when done
        }
      });
    });
  }

  void _playSound() async {
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _audioDuration = duration;
      });
    });

    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _audioPosition = position;
      });
    });

    while (num <= 6) {
      if (isPaused) {
        return;
      }
      print('Playing audio: $num');
      await _audioPlayer.play(
        AssetSource('story 1.$num.mp3'),
      );
      await _audioPlayer.onPlayerComplete.first;

      if (num < 6) {
        _controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );

        await Future.delayed(const Duration(milliseconds: 300));
        num++;
      } else {
        isLesson = true;
        setState(() {});
      }
    }
  }

  void _pauseSound() async {
    _audioPlayer.pause();
    _timer?.cancel();
    _timer = null;
    setState(() {
      isPaused = true;
    });
  }

  void _resumeSound() async {
    if (isPaused) {
      _startTimer();
      _audioPlayer.resume();
      setState(() {
        isPaused = false;
      });
      _playSound();
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              Page1(),
              Page2(),
              Page3(),
              Page4(),
              Page5(),
              Lesson(),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: LinearProgressIndicator(
                value: _progressValue,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ),
          !isLesson
              ? Positioned(
                  bottom: 10,
                  left: 150,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: _resumeSound,
                        child: const Text('Resume'),
                      ),
                      ElevatedButton(
                        onPressed: _pauseSound,
                        child: const Text('Pause'),
                      ),
                    ],
                  ),
                )
              : Positioned(
                  bottom: 10,
                  left: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => Home(),
                        ),
                      );
                    },
                    child: const Text('Done'),
                  ),
                ),
        ],
      ),
    );
  }
}
