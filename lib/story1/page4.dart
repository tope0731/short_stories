import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Image.asset('assets/scene 4.png'),
            ),
            Positioned(
              bottom: 150,
              left: 10,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '''One day, the ants decided that they couldn’t keep on suffering like this & wanted to teach the elephant a lesson.''',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
