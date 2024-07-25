import 'package:get/get.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:radio_news/core/app_size.dart';
import 'package:flutter_svg/svg.dart';
import 'package:radio_news/core/app_asset.dart';
import 'package:radio_news/core/app_color.dart';
import 'package:radio_news/core/app_event_data.dart';
import 'package:radio_news/src/controller/system_controller.dart';
import 'package:radio_news/src/view/widget/custom_appbar.dart';

// Assume exist event is sharing data to playing screen.
final SystemController controller = Get.put(SystemController());

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MyDrawer(),
      appBar: AppBar(
        toolbarHeight: AppBarDimension.toolBar,
        title: const CustomAppBar(),
      ),
      body: const Center(
        child: DisplayEvent(),
      ),
    );
  }
}

class DisplayEvent extends StatelessWidget {
  const DisplayEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppEventData.eventChannel.isEmpty
        ? const DisplayEmptyIcon()
        : const DisplayEventItems();
  }
}

class DisplayEmptyIcon extends StatelessWidget {
  const DisplayEmptyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.only(bottom: 100.0, left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcATop,
              ),
              child: SvgPicture.asset(
                AppAsset.emptyEvent,
                width: size.height * EventDimension.eventIcon,
                height: size.height * EventDimension.eventIcon,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'SaigonNewsRadio does not have any upcomming events',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}

class DisplayEventItems extends StatelessWidget {
  const DisplayEventItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
