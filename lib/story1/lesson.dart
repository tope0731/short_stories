import 'package:flutter/material.dart';

class Lesson extends StatelessWidget {
  const Lesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Image.asset('assets/lesson.png'),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '''Be down to earth. Never forget your roots. Treat everyone with respect. Incase you are in a position bigger than others, then use that to protect them instead of hurting them.''',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
