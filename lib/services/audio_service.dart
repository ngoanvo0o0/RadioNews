import 'package:flutter/services.dart';

class AudioService {
  static const platform = MethodChannel('com.your.package.name/audio_service');

  Future<void> startService() async {
    try {
      await platform.invokeMethod('startService');
    } on PlatformException catch (e) {
      print("Failed to start service: '${e.message}'.");
    }
  }
}
