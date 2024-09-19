import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Image.asset('assets/scene 2.png'),
            ),
            Positioned(
              bottom: 150,
              left: 10,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '''He would march up to the ant colony and shower water on them. ''',
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
