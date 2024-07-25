import 'package:get/get.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:radio_news/core/app_size.dart';
import 'package:flutter_svg/svg.dart';
import 'package:radio_news/core/app_asset.dart';
import 'package:radio_news/core/app_color.dart';
import 'package:radio_news/core/app_types.dart';
import 'package:radio_news/src/view/widget/custom_appbar.dart';
import 'package:radio_news/src/view/widget/custom_button.dart';
import 'package:radio_news/src/controller/system_controller.dart';
import 'package:radio_news/src/controller/player_controller.dart';

final SystemController controller = Get.put(SystemController());
final PlayerController player = Get.put(PlayerController());

class RecordingListScreen extends StatelessWidget {
  const RecordingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: const MyDrawer(),
      appBar: AppBar(
        toolbarHeight: AppBarDimension.toolBar,
        title: const CustomAppBar(),
      ),
      body: Scrollbar(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const HeaderContainer(),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: size.height * RecordingListDimension.recording,
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcATop,
                    ),
                    child: SvgPicture.asset(
                      AppAsset.recordingBG,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                PlayButton(
                  backgroundDimention: 44.0,
                  onPressed: () {
                    controller.switchScreenIndex(ScreenIndex.playing.index);
                    const latestRecordIndex = 0;
                    controller.setRecordingIndex(latestRecordIndex);
                    player.setUrl(
                        controller.getAppLatestRecording().recordingUrl);
                  },
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest recordings",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View all",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const RecordingSlider(),
            const FooterBar(),
          ],
        ),
      ),
    );
  }
}

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: DarkThemeColor.lineColor,
            width: RecordingListDimension.line,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "SaigonNewsRadio",
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                FollowButton(
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RecordingSlider extends StatelessWidget {
  const RecordingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final recordingList = Get.find<SystemController>().getAppRecordingList();
    return SizedBox(
      height: 220, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.calculateSliderItems(),
        itemBuilder: (context, index) {
          return Container(
            width: 380, // Adjust the width as needed
            margin: const EdgeInsets.only(left: 8.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcATop,
                    ),
                    child: SvgPicture.asset(
                      AppAsset.recordingBG,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DisplayRecordingTitle(
                                    recordingTitle: recordingList[index].title),
                                DisplayRecordingDate(
                                  releaseDate: formatDateString(
                                      recordingList[index].releaseDate),
                                ),
                              ],
                            ),
                            PlayButton(
                              backgroundDimention: 44,
                              onPressed: () {
                                controller.switchScreenIndex(
                                    ScreenIndex.playing.index);
                                controller.setRecordingIndex(index);
                                player
                                    .setUrl(recordingList[index].recordingUrl);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DisplayRecordingTitle extends StatelessWidget {
  final String recordingTitle;
  const DisplayRecordingTitle({super.key, required this.recordingTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.left,
      recordingTitle,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class DisplayRecordingDate extends StatelessWidget {
  final String releaseDate;
  const DisplayRecordingDate({super.key, required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.left,
      releaseDate,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class FooterBar extends StatelessWidget {
  const FooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.isFooterBarVisible(),
        child: Stack(
          children: [
            Positioned(
                child: SizedBox(
              width: 800,
              height: 60,
              child: FloatingActionButton(
                onPressed: () {
                  controller.setFooterBarRequest(false);
                },
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
              ),
            )),
            Positioned(
              child: Row(
                children: [
                  BackHomeButton(
                      backgroundDimention: 30,
                      onPressed: () {
                        controller.setFooterBarRequest(false);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
