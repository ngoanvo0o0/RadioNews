import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:radio_news/core/app_asset.dart';
import 'package:radio_news/core/app_size.dart';
import 'package:radio_news/core/app_types.dart';
import 'package:radio_news/main.dart';
import 'package:radio_news/src/controller/system_controller.dart';
import 'package:radio_news/src/view/widget/custom_button.dart';
import 'package:radio_news/src/view/widget/custom_appbar.dart';
import 'package:radio_news/src/controller/player_controller.dart';

final SystemController controller = Get.put(SystemController());
final PlayerController player = Get.put(PlayerController());

class PlayingScreen extends StatelessWidget {
  const PlayingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const FillBackGound(),
        Positioned(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const DisplayAppLogo(),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "SaigonNewsRadio",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  ColorFiltered(
                                    colorFilter: const ColorFilter.mode(
                                      Colors.black,
                                      BlendMode.srcATop,
                                    ),
                                    child: SvgPicture.asset(
                                      AppAsset.user,
                                      width: 15.0,
                                      height: 15.0,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "Follow",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const ThemeSwitch(),
                        const SizedBox(width: 10),
                        BackHomeButton(
                            backgroundDimention: 40,
                            onPressed: () {
                              controller
                                  .switchScreenIndex(ScreenIndex.home.index);
                              controller.setFooterBarRequest(true);
                            }),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0), //respondsive here
                      child: Column(
                        children: [
                          const PlayPauseButton(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TurnBackButton(
                                backgroundDimention: 44,
                                onPressed: () {
                                  player.seekBackward();
                                },
                              ),
                              const AudioPlayerScreen(),
                              GoForwardButton(
                                backgroundDimention: 44,
                                onPressed: () {
                                  player.seekForward();
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 100,
                        child: AudioWaveForm(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const SpeakerToggle(),
                              const SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ColorFiltered(
                                        colorFilter: const ColorFilter.mode(
                                          Colors.black,
                                          BlendMode.srcATop,
                                        ),
                                        child: SvgPicture.asset(
                                          AppAsset.copyright,
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        controller
                                            .getAppRecordingList()[
                                                controller.getRecordingIndex()]
                                            .title,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    formatDateString(controller
                                        .getAppRecordingList()[
                                            controller.getRecordingIndex()]
                                        .releaseDate),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              const WaveToggle(),
                              const SizedBox(width: 10.0),
                              ShareButton(
                                  backgroundDimention: 44, onPressed: () {}),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class FillBackGound extends StatelessWidget {
  const FillBackGound({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(
        Colors.black,
        BlendMode.srcATop,
      ),
      child: SvgPicture.asset(
        AppAsset.recordingBG,
        fit: BoxFit.cover,
      ),
    );
  }
}

class AudioPlayerScreen extends StatelessWidget {
  const AudioPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250, //redefine for responsdive
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            final position = player.position.value;
            final duration = player.duration.value;
            return Column(
              children: [
                SizedBox(
                  //width: 300, //đô rộng slider, cần hiệu chỉnh
                  child: Slider(
                    value: position.inSeconds.toDouble(),
                    max: duration.inSeconds.toDouble(),
                    onChanged: (value) {
                      player.seek(Duration(seconds: value.toInt()));
                    },
                    activeColor: Colors.black, // Màu của phần đã phát
                    inactiveColor: Colors.grey, // Màu của phần chưa phát
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(position.toString().split('.').first),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(position.toString().split('.').first),
                    )
                  ],
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class AudioWaveForm extends StatefulWidget {
  @override
  State<AudioWaveForm> createState() => _AudioWaveForm();
}

class _AudioWaveForm extends State<AudioWaveForm> {
  int rectangleNum = 50;
  List<double> rectangleHeights = [];
  Timer? _timer;
  StreamSubscription<bool>? _playingSubscription;

  @override
  void initState() {
    super.initState();
    rectangleHeights = generateRandomHeights(rectangleNum);
    _playingSubscription = player.player.playingStream.listen((playing) {
      if (playing) {
        _startUpdatingWaveform();
      } else {
        _stopUpdatingWaveform();
      }
    });
  }

  void _startUpdatingWaveform() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      _updateWaveform();
    });
  }

  void _stopUpdatingWaveform() {
    _timer?.cancel();
  }

  void _updateWaveform() {
    setState(() {
      rectangleHeights = generateRandomHeights(rectangleNum);
    });
  }

  @override
  void dispose() {
    _playingSubscription?.cancel();
    _stopUpdatingWaveform();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: rectangleHeights.map((height) {
            return Container(
              height: height,
              width: 4,
              //color: Colors.black,
              margin: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  //color: Colors.white, // Color of the border
                  width: 2.0, // Width of the border
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  List<double> generateRandomHeights(rectangleNum) {
    Random random = Random();
    List<double> heights = [];
    for (int i = 0; i < rectangleNum; i++) {
      double randomHeight =
          10 + random.nextDouble() * (100 - 1); // Giới hạn giá trị từ 3 đến 20
      heights.add(randomHeight);
    }
    return heights;
  }
}
