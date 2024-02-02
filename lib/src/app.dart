import 'package:flutter/material.dart';
import 'package:gitstory/src/screens/homescreen.dart';

class Gitstory extends StatelessWidget {
  const Gitstory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gitstory',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homescreen(title: 'Gitstory'),
    );
  }
}
