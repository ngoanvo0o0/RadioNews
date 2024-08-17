import 'package:flutter/services.dart';

class ForegroundService {
  static const MethodChannel _channel = MethodChannel('your_channel');

  static Future<void> startService() async {
    await _channel.invokeMethod('startService');
  }

  static Future<void> stopService() async {
    await _channel.invokeMethod('stopService');
  }
}
