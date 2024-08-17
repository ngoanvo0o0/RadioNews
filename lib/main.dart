import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:radio_news/src/view/screen/home_screen.dart';
import 'package:radio_news/src/controller/system_controller.dart';
import 'package:radio_news/src/controller/radio_live_controller.dart';
import 'package:radio_news/src/controller/player_controller.dart';

final SystemController systemController = Get.put(SystemController());
final RadioLiveController radioLiveController = Get.put(RadioLiveController());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(RadioLiveController());
  // Đăng ký PlayerController với GetX
  Get.put(PlayerController());
  await Get.find<RadioLiveController>().fetchRadioLiveData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        theme: systemController.theme.value,
        home: HomeScreen(),
      );
    });
  }
}
