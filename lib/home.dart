import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:short_stories/story1/story.dart';
import 'package:short_stories/story2/story.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => Story2(),
            ),
          );
        },
        child: Text('Story'),
      ),
    );
  }
}
