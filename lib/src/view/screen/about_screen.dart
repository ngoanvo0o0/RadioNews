import 'package:get/get.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:radio_news/core/app_size.dart';
import 'package:flutter_svg/svg.dart';
import 'package:radio_news/core/app_asset.dart';
import 'package:radio_news/core/app_color.dart';
import 'package:radio_news/src/view/widget/custom_appbar.dart';
import 'package:radio_news/src/controller/system_controller.dart';

// Assume exist event is sharing data to playing screen.
final SystemController controller = Get.put(SystemController());

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MyDrawer(),
      appBar: AppBar(
        toolbarHeight: AppBarDimension.toolBar,
        title: const CustomAppBar(),
      ),
      body: Container(
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "About SaigonNewsRadio",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DisplayFollower(),
                  Expanded(
                    child: DisplayListeners(),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Followers",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Total Listens",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcATop,
                      ),
                      child: SvgPicture.asset(
                        AppAsset.earthIcon,
                        width: AboutDimention.earth,
                        height: AboutDimention.earth,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    const Expanded(
                      child: DisplayFirstConnection(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcATop,
                      ),
                      child: SvgPicture.asset(
                        AppAsset.earthIcon,
                        width: AboutDimention.earth,
                        height: AboutDimention.earth,
                      ),
                    ),
                    //becasue fontsize is not changed, so we should fixed based on it.
                    const SizedBox(width: 10.0),
                    const Expanded(
                      child: DisplaySecondConnection(),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class DisplayFollower extends StatelessWidget {
  const DisplayFollower({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(
          textAlign: TextAlign.left,
          '${Get.find<SystemController>().getAppInformation().followers}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}

class DisplayListeners extends StatelessWidget {
  const DisplayListeners({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(
          textAlign: TextAlign.center,
          '${Get.find<SystemController>().getAppInformation().listeners}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}

class DisplayFirstConnection extends StatelessWidget {
  const DisplayFirstConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(
          textAlign: TextAlign.left,
          Get.find<SystemController>().getAppInformation().firstUrl,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}

class DisplaySecondConnection extends StatelessWidget {
  const DisplaySecondConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(
          textAlign: TextAlign.left,
          Get.find<SystemController>().getAppInformation().secondUrl,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
