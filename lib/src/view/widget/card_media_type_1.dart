import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:radio_news/core/app_asset.dart';
import 'package:radio_news/core/app_types.dart';
import 'package:radio_news/src/controller/player_controller.dart';
import 'package:radio_news/src/view/widget/custom_button.dart';
import 'package:radio_news/core/app_recording_list.dart'; // Import the file for text styles

final PlayerController player = Get.find<PlayerController>();

class CardMediaType1 extends StatelessWidget {
  final String title;
  final String date;
  final String link;

  const CardMediaType1({
    super.key,
    required this.title,
    required this.date,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final cardWidth = screenWidth - 2 * 8; // Padding 8px on each side
        final cardHeight =
            cardWidth / 1.618; // Aspect ratio of 1:1.618 (Golden Ratio)

        return Card(
          elevation: 4.0, // Adjust the elevation as needed
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Border radius
          ),
          margin: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0), // Padding: 8px on each side, 16px top and bottom
          child: Container(
            width: cardWidth,
            height: cardHeight,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0), // Border radius
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
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DisplayRecordingTitle(recordingTitle: title),
                            const SizedBox(
                                height: 8.0), // Space between title and date
                            DisplayRecordingDate(releaseDate: date),
                          ],
                        ),
                      ),
                      const SizedBox(
                          width:
                              8.0), // Space between text column and PlayButton
                      PlayButton(
                        backgroundDimention: 44,
                        onPressed: () {
                          controller
                              .switchScreenIndex(ScreenIndex.playing.index);
                          const latestRecordIndex = 0;
                          controller.setRecordingIndex(latestRecordIndex);
                          player.setUrl(link);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DisplayRecordingTitle extends StatelessWidget {
  final String recordingTitle;

  const DisplayRecordingTitle({super.key, required this.recordingTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      recordingTitle,
      style: AppRecordingList
          .titleStyle, // Apply title style from AppRecordingList
    );
  }
}

class DisplayRecordingDate extends StatelessWidget {
  final String releaseDate;

  const DisplayRecordingDate({super.key, required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Text(
      releaseDate,
      style:
          AppRecordingList.dateStyle, // Apply date style from AppRecordingList
    );
  }
}
