import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gitstory/src/internal/device.dart';
import 'package:gitstory/src/screens/homescreen.dart';

class Gitstory extends StatelessWidget {
  const Gitstory({super.key});

  @override
  Widget build(BuildContext context) {
    if (androidSdk >= 29) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.edgeToEdge,
      );
      Future.delayed(const Duration(milliseconds: 1)).then((value) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent,
            statusBarColor: Colors.transparent,
          ),
        );
      });
    }
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
