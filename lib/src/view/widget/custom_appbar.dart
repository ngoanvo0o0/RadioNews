import 'package:get/get.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:radio_news/core/app_size.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:radio_news/core/app_asset.dart';
//import 'package:radio_news/core/app_color.dart';
import 'package:radio_news/core/app_types.dart';
import 'package:radio_news/src/view/widget/custom_button.dart';
import 'package:radio_news/src/controller/system_controller.dart';
import 'package:radio_news/src/controller/player_controller.dart';

final SystemController controller = Get.put(SystemController());
final PlayerController player = Get.put(PlayerController());

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DisplayAppLogo(),
          ThemeSwitch(),
        ]);
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(left: 20.0),
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

class DisplayAppLogo extends StatelessWidget {
  const DisplayAppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAsset.radioNewsLogo,
        width: AppBarDimension.logo, height: AppBarDimension.logo);
  }
}
