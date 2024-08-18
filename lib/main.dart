// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'dart:ui' show PointerDeviceKind;
// import 'package:radio_news/src/view/screen/home_screen.dart';
// import 'package:radio_news/src/view/screen/loading_screen.dart';
// import 'package:radio_news/src/controller/system_controller.dart';
// import 'package:radio_news/src/controller/radio_live_controller.dart';
// import 'package:radio_news/src/controller/player_controller.dart';
// import 'package:audio_service/audio_service.dart'; // Thêm import này

// final SystemController systemController = Get.put(SystemController());
// final RadioLiveController radioLiveController = Get.put(RadioLiveController());

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Khởi tạo các controller
//   Get.put(RadioLiveController());
//   Get.put(PlayerController());

//   // Khởi tạo AudioService
//   await AudioService.init(
//     builder: () =>
//         MyAudioHandler(), // Thay thế MyAudioHandler bằng PlayerController nếu cần
//     config: AudioServiceConfig(
//       androidNotificationChannelId: 'com.example.audio_service.channel',
//       androidNotificationChannelName: 'Audio Service',
//       androidNotificationOngoing: true,
//       androidStopForegroundOnPause: true,
//     ),
//   );

//   // Chạy tải dữ liệu và chờ ít nhất 2 giây
//   await Future.wait([
//     Get.find<RadioLiveController>().fetchRadioLiveData(),
//     Future.delayed(const Duration(seconds: 2)),
//   ]);

//   // Sau khi dữ liệu đã tải xong và thời gian chờ hoàn thành, chuyển sang HomeScreen
//   radioLiveController.isLoading(false);

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         scrollBehavior: const MaterialScrollBehavior().copyWith(
//           dragDevices: {
//             PointerDeviceKind.mouse,
//             PointerDeviceKind.touch,
//           },
//         ),
//         theme: systemController.theme.value,
//         home: radioLiveController.isLoading.value
//             ? const LoadingScreen()
//             : HomeScreen(),
//       );
//     });
//   }
// }

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:radio_news/src/view/screen/home_screen.dart';
import 'package:radio_news/src/view/screen/loading_screen.dart';
import 'package:radio_news/src/controller/system_controller.dart';
import 'package:radio_news/src/controller/radio_live_controller.dart';
import 'package:radio_news/src/controller/player_controller.dart';

final SystemController systemController = Get.put(SystemController());
final RadioLiveController radioLiveController = Get.put(RadioLiveController());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(RadioLiveController());
  Get.put(PlayerController());

  // Run the app with the loading screen first
  runApp(const MyApp());

  // Chạy tải dữ liệu và chờ ít nhất 2 giây
  await Future.wait([
    Get.find<RadioLiveController>().fetchRadioLiveData(),
    Future.delayed(const Duration(seconds: 2)),
  ]);

  // Sau khi dữ liệu đã tải xong và thời gian chờ hoàn thành, chuyển sang HomeScreen
  radioLiveController.isLoading(false);
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
        home: radioLiveController.isLoading.value
            ? const LoadingScreen()
            : HomeScreen(),
      );
    });
  }
}



// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'dart:ui' show PointerDeviceKind;
// import 'package:radio_news/src/view/screen/home_screen.dart';
// import 'package:radio_news/src/controller/system_controller.dart';
// import 'package:radio_news/src/controller/radio_live_controller.dart';
// import 'package:radio_news/src/controller/player_controller.dart';

// final SystemController systemController = Get.put(SystemController());
// final RadioLiveController radioLiveController = Get.put(RadioLiveController());

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Get.put(RadioLiveController());
//   // Đăng ký PlayerController với GetX
//   Get.put(PlayerController());
//   await Get.find<RadioLiveController>().fetchRadioLiveData();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         scrollBehavior: const MaterialScrollBehavior().copyWith(
//           dragDevices: {
//             PointerDeviceKind.mouse,
//             PointerDeviceKind.touch,
//           },
//         ),
//         theme: systemController.theme.value,
//         home: HomeScreen(),
//       );
//     });
//   }
// }
