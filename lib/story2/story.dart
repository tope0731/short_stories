import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Story2 extends StatefulWidget {
  const Story2({super.key});

  @override
  State<Story2> createState() => _Story2State();
}

class _Story2State extends State<Story2> {
  final PageController _controller = PageController();
  double _progressValue = 0.0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Story 2'),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [],
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: LinearProgressIndicator(
                value: _progressValue,
                backgroundColor: Colors.red[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
