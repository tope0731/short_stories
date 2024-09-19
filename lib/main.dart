import 'package:flutter/material.dart';
import 'package:short_stories/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Stories());
}

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
