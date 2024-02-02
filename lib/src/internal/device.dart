import 'package:device_info_plus/device_info_plus.dart';

enum DevicePlatform { android, ios, other }

DevicePlatform? platform;
int? _androidSdk;

Future<void> populateDeviceInfo() async {
  final deviceInfo = await DeviceInfoPlugin().deviceInfo;
  if (deviceInfo is AndroidDeviceInfo) {
    platform = DevicePlatform.android;
    _androidSdk = deviceInfo.version.sdkInt;
  } else if (deviceInfo is IosDeviceInfo) {
    platform = DevicePlatform.ios;
  } else {
    platform = DevicePlatform.other;
  }
}

bool get isAndroid {
  return platform != null && platform == DevicePlatform.android;
}

int get androidSdk {
  return _androidSdk ?? 0;
}
