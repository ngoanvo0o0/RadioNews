import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:radio_news/core/app_asset.dart';
import 'package:radio_news/core/app_size.dart';
import 'package:radio_news/core/app_types.dart';
import 'package:radio_news/src/view/screen/cart_screen.dart';
import 'package:radio_news/src/view/screen/playing_screen.dart';
import 'package:radio_news/src/view/screen/profile_screen.dart';
import 'package:radio_news/src/controller/system_controller.dart';
import 'package:radio_news/src/view/screen/favorite_screen.dart';
import 'package:radio_news/src/view/screen/recordings_screen.dart';
import 'package:radio_news/src/view/widget/page_transition.dart';
import 'package:radio_news/src/view/screen/events_screen.dart';
import 'package:radio_news/src/view/screen/recordings_screen.dart';
import 'package:radio_news/src/view/screen/recording_list_screen.dart';
import 'package:radio_news/src/view/screen/about_screen.dart';
import 'package:radio_news/src/view/widget/custom_button.dart';
import 'package:radio_news/src/controller/player_controller.dart';

final SystemController controller = Get.put(SystemController());
final PlayerController player = Get.put(PlayerController());

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> screen = [
    const RecordingListScreen(), // testing, remove later
    const EventScreen(),
    const CartScreen(),
    const AboutScreen(),
    const PlayingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => PageTransition(
          child: screen[controller.getScreenIndex()],
        ),
      ),
    );
    // implement hard back button in phone here.
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: const Text('Home'),
            onTap: () {
              controller.switchScreenIndex(ScreenIndex.home.index);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Event'),
            onTap: () {
              controller.switchScreenIndex(ScreenIndex.event.index);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Recording'),
            onTap: () {
              controller.switchScreenIndex(ScreenIndex.recording.index);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              controller.switchScreenIndex(ScreenIndex.about.index);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
