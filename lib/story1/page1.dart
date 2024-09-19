import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Image.asset('assets/scene 1.png'),
            ),
            Positioned(
              bottom: 150,
              left: 10,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '''Once upon a time, in a forest there lived an elephant who took pleasure in troubling smaller animals.''',
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
