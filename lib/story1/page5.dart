import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Image.asset('assets/scene 5.png'),
            ),
            Positioned(
              bottom: 150,
              left: 10,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '''Realizing his mistake, the elephant immediately apologized to the ants and other animals he had troubled in the past.''',
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
