import 'package:get/get.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_svg/svg.dart';
import 'package:radio_news/core/app_types.dart';
import 'package:radio_news/src/model/recording.dart';
import 'package:radio_news/src/view/widget/custom_appbar.dart';
import 'package:radio_news/src/view/widget/custom_button.dart';
import 'package:radio_news/src/controller/system_controller.dart';
import 'package:radio_news/src/controller/player_controller.dart';
import 'package:radio_news/core/app_design.dart';
import 'package:radio_news/core/app_size.dart';
import 'package:radio_news/core/app_virtual_main_screen.dart';

final SystemController controller = Get.put(SystemController());
final PlayerController player = Get.put(PlayerController());

class MainRecordScreen extends StatelessWidget {
  const MainRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: const MyDrawer(),
      appBar: AppBar(
        toolbarHeight: MyAppBar.appbarSize,
        title: const CustomAppBar(),
      ),
      body: Stack(
        children: [
          Scrollbar(
            child: ListView(
              children: [
                const HeaderContainer(),
                MainRecording(viewPort: size.height),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: const CarouselHeader(),
                ),
                const RecordingSlider(),
                SizedBox(
                  // this code is used for UI, we should have a space in bottom,
                  // User can scroll to see all recording infor in case the audio is running
                  height: MyAppBar.appbarSize + 10.0,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 0.0,
            right: 0.0,
            child: FooterBar(viewPort: size.width),
          )
        ],
      ),
    );
  }
}

class MainRecording extends StatelessWidget {
  final double viewPort;
  const MainRecording({super.key, required this.viewPort});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: viewPort * MainRec.viewPort,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                controller.getThemeMode()
                    ? MainRec.backgroundColor
                    : MainRecDark.backgroundColor,
                BlendMode.srcATop,
              ),
              child: SvgPicture.asset(
                MainRec.recBGPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const PlayMainRecordButton(),
        ],
      ),
    );
  }
}

class CarouselHeader extends StatelessWidget {
  const CarouselHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(CarouselInfor.latestRec,
              textAlign: TextAlign.left,
              style: controller.getThemeMode()
                  ? CarouselInfor.latestRecStyle
                  : CarouselInforDark.latestRecStyle),
          Text(CarouselInfor.viewAll,
              textAlign: TextAlign.left,
              style: controller.getThemeMode()
                  ? CarouselInfor.viewAllStyle
                  : CarouselInforDark.viewAllStyle),
        ],
      ),
    );
  }
}

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: controller.getThemeMode()
                    ? MainHeader.lineColor
                    : MainHeaderDark.lineColor,
                width: MainHeader.lineSize,
              ),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  MainHeader.appName,
                  textAlign: TextAlign.left,
                  style: controller.getThemeMode()
                      ? MainHeader.appNameStyle
                      : MainHeaderDark.appNameStyle,
                ),
                FollowButton(
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }
}

class RecordingSlider extends StatelessWidget {
  const RecordingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      //final recordingList = Get.find<SystemController>().getAppRecordingList();\
      final recordingList = controller.getAppRecordingList();
      final isLightModeOn = controller.getThemeMode();
      return SizedBox(
        height: RecSlider.height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.calculateSliderItems(),
          itemBuilder: (context, index) {
            return Container(
              width: RecSlider.width,
              margin: const EdgeInsets.only(left: 8.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        isLightModeOn
                            ? RecSlider.iconColor
                            : RecSliderDark.iconColor,
                        BlendMode.srcATop,
                      ),
                      child: SvgPicture.asset(
                        RecSlider.iconPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 10, right: 10),
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
                                    recordingTitle: recordingList[index].title,
                                  ),
                                  DisplayRecordingDate(
                                    releaseDate: formatDateString(
                                        recordingList[index].releaseDate),
                                  ),
                                ],
                              ),
                              PlayCardButton(
                                cardIndex: index,
                                records: recordingList,
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
    });
  }
}

class DisplayRecordingTitle extends StatelessWidget {
  final String recordingTitle;
  const DisplayRecordingTitle({
    super.key,
    required this.recordingTitle,
  });

  @override
  Widget build(BuildContext context) {
    return LimitedTextScroller(
      text: recordingTitle,
      maxLength: 20,
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
      style: controller.getThemeMode()
          ? RecDetail.recRelease
          : RecDetailDark.recRelease,
    );
  }
}

class FooterBar extends StatelessWidget {
  final double viewPort;
  const FooterBar({super.key, required this.viewPort});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.isFooterBarVisible(),
        child: Stack(
          children: [
            Positioned(
                child: SizedBox(
              width: viewPort,
              height: FooterDetail.height,
              child: FloatingActionButton(
                onPressed: () {
                  controller.switchScreenIndex(ScreenIndex.playing.index);
                },
                backgroundColor: controller.getThemeMode()
                    ? FooterDetail.backgroundColor
                    : FooterDetailDark.backgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
              ),
            )),
            const Positioned(
              left: 10.0,
              top: (FooterDetail.height - ControllRec.size) / 2,
              child: SmallPlayPauseButton(),
            ),
            const Positioned(
              right: 10.0,
              top: (FooterDetail.height - QuiteButtonL.size) / 2,
              child: QuitXButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayMainRecordButton extends StatelessWidget {
  const PlayMainRecordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomButton(
        buttonDimention: RecPlayButton.buttonSize,
        onPressed: () {
          controller.switchScreenIndex(ScreenIndex.playing.index);
          const latestRecordIndex = 0;
          controller.setRecordingIndex(latestRecordIndex);
          player.setUrl(controller.getAppmainRecord().recordingUrl);
        },
        iconPath: RecPlayButton.playIconPath,
        backgroundColor: controller.getThemeMode()
            ? RecPlayButton.buttonColor
            : RecPlayButtonDark.buttonColor,
        iconColor: RecPlayButton.iconColor,
      ),
    );
  }
}

class PlayCardButton extends StatelessWidget {
  final int cardIndex;
  final List<Recording> records;
  const PlayCardButton(
      {super.key, required this.cardIndex, required this.records});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomButton(
        buttonDimention: CardPlayButton.size,
        onPressed: () {
          controller.switchScreenIndex(ScreenIndex.playing.index);
          controller.setRecordingIndex(cardIndex);
          player.setUrl(records[cardIndex].recordingUrl);
        },
        iconPath: CardPlayButton.iconPath,
        backgroundColor: controller.getThemeMode()
            ? CardPlayButton.backgroundColor
            : CardPlayButtonDark.backgroundColor,
        iconColor: Colors.white,
      ),
    );
  }
}

class QuitXButton extends StatelessWidget {
  const QuitXButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomButton(
        buttonDimention: QuiteButtonL.size,
        onPressed: () {
          controller.setFooterBarRequest(false);
          Get.find<PlayerController>().pause();
          Get.find<PlayerController>().dispose();
        },
        iconPath: QuiteButtonL.iconPath,
        backgroundColor: controller.getThemeMode()
            ? QuiteButtonL.bgColor
            : QuiteButtonD.bgColor,
        iconColor: controller.getThemeMode()
            ? QuiteButtonL.iconColor
            : QuiteButtonD.iconColor));
  }
}
