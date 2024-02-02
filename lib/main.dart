import 'package:flutter/material.dart';
import 'package:gitstory/src/app.dart';
import 'package:gitstory/src/internal/device.dart';

void main() async {
  // Initialize WidgetsBinding
  WidgetsFlutterBinding.ensureInitialized();

  // Populate globally available device platform information
  await populateDeviceInfo();

  runApp(const Gitstory());
}
