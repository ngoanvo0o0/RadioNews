import 'package:get/get.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:radio_news/core/app_size.dart';
import 'package:flutter_svg/svg.dart';
import 'package:radio_news/core/app_asset.dart';
import 'package:radio_news/core/app_color.dart';
import 'package:radio_news/src/controller/player_controller.dart';
import 'package:radio_news/src/controller/system_controller.dart';

final SystemController controller = Get.put(SystemController());

class PlayButton extends StatelessWidget {
  final double backgroundDimention;
  final VoidCallback onPressed;

  const PlayButton({
    super.key,
    required this.backgroundDimention,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: backgroundDimention,
      height: backgroundDimention,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: Center(
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcATop,
            ),
            child: SvgPicture.asset(
              AppAsset.play,
              width: backgroundDimention / 2,
              height: backgroundDimention / 2,
            ),
          ),
        ),
      ),
    );
  }
}

class PauseButton extends StatelessWidget {
  final double backgroundDimention;
  final VoidCallback onPressed;

  const PauseButton({
    super.key,
    required this.backgroundDimention,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: backgroundDimention,
      height: backgroundDimention,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: Center(
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcATop,
            ),
            child: SvgPicture.asset(
              AppAsset.pause,
              width: backgroundDimention / 2,
              height: backgroundDimention / 2,
            ),
          ),
        ),
      ),
    );
  }
}

class TurnBackButton extends StatelessWidget {
  final double backgroundDimention;
  final VoidCallback onPressed;

  const TurnBackButton({
    super.key,
    required this.backgroundDimention,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: backgroundDimention,
      height: backgroundDimention,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: Center(
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcATop,
            ),
            child: SvgPicture.asset(
              AppAsset.goBack,
              width: backgroundDimention / 2,
              height: backgroundDimention / 2,
            ),
          ),
        ),
      ),
    );
  }
}

class GoForwardButton extends StatelessWidget {
  final double backgroundDimention;
  final VoidCallback onPressed;

  const GoForwardButton({
    super.key,
    required this.backgroundDimention,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: backgroundDimention,
      height: backgroundDimention,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: Center(
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcATop,
            ),
            child: SvgPicture.asset(
              AppAsset.goForward,
              width: backgroundDimention / 2,
              height: backgroundDimention / 2,
            ),
          ),
        ),
      ),
    );
  }
}

class BackHomeButton extends StatelessWidget {
  final double backgroundDimention;
  final VoidCallback onPressed;

  const BackHomeButton({
    super.key,
    required this.backgroundDimention,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: backgroundDimention,
      height: backgroundDimention,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: Center(
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcATop,
            ),
            child: SvgPicture.asset(
              AppAsset.downArrow,
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class ShareButton extends StatelessWidget {
  final double backgroundDimention;
  final VoidCallback onPressed;

  const ShareButton({
    super.key,
    required this.backgroundDimention,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: backgroundDimention,
      height: backgroundDimention,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: Center(
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcATop,
            ),
            child: SvgPicture.asset(
              AppAsset.sharing,
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({super.key});
  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  bool _isPlaying = true;

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 82,
      height: 82,
      child: FloatingActionButton(
        onPressed: () {
          _togglePlayPause();
          if (Get.find<PlayerController>().isAudioPlaying()) {
            Get.find<PlayerController>().pause();
          } else {
            Get.find<PlayerController>().play();
          }
        },
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: Center(
          child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcATop,
              ),
              child: _isPlaying
                  ? SvgPicture.asset(
                      AppAsset.pause,
                      width: 40,
                      height: 40,
                    )
                  : SvgPicture.asset(
                      AppAsset.play,
                      width: 40,
                      height: 40,
                    )),
        ),
      ),
    );
  }
}

class SpeakerToggle extends StatefulWidget {
  const SpeakerToggle({super.key});
  @override
  State<SpeakerToggle> createState() => _SpeakerToggle();
}

class _SpeakerToggle extends State<SpeakerToggle> {
  bool _isSpeakerOn = true;

  void _toggleSpeaker() {
    setState(() {
      _isSpeakerOn = !_isSpeakerOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: FloatingActionButton(
        onPressed: () {
          _toggleSpeaker();
          const minVolume = 0.0;
          if (Get.find<PlayerController>().getSpeakerValue() != minVolume) {
            Get.find<PlayerController>().turnOffSpeaker();
          } else {
            Get.find<PlayerController>().turnOnSpeaker();
          }
        },
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: Center(
          child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcATop,
              ),
              child: _isSpeakerOn
                  ? SvgPicture.asset(
                      AppAsset.speaker,
                      width: 24,
                      height: 24,
                    )
                  : SvgPicture.asset(
                      AppAsset.mute,
                      width: 24,
                      height: 24,
                    )),
        ),
      ),
    );
  }
}

class WaveToggle extends StatefulWidget {
  const WaveToggle({super.key});
  @override
  State<WaveToggle> createState() => _WaveToggle();
}

class _WaveToggle extends State<WaveToggle> {
  bool _isWaveOn = true;

  void _toggleWave() {
    setState(() {
      _isWaveOn = !_isWaveOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: FloatingActionButton(
        onPressed: () {
          _toggleWave();
          //TBD
        },
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: Center(
          child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcATop,
              ),
              child: _isWaveOn
                  ? SvgPicture.asset(
                      AppAsset.openWave,
                      width: 24,
                      height: 24,
                    )
                  : SvgPicture.asset(
                      AppAsset.closeWave,
                      width: 24,
                      height: 24,
                    )),
        ),
      ),
    );
  }
}

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitch();
}

class _ThemeSwitch extends State<ThemeSwitch> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
          controller.isLightTheme = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 44,
        height: 24,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF999999) : const Color(0xFFcdac00),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: isActive ? 22.0 : 2.0,
              right: isActive ? 2.0 : 22.0,
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                left: 6.0,
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcATop,
                  ),
                  child: SvgPicture.asset(
                    AppAsset.moon,
                    width: 12,
                    height: 12,
                  ),
                )),
            Positioned(
                right: 6.0,
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcATop,
                  ),
                  child: SvgPicture.asset(
                    AppAsset.sun,
                    width: 12,
                    height: 12,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class FollowButton1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: 300,
      height: 22, // Chiều cao 50
      child: ElevatedButton(
        onPressed: () {
          // Hành động khi nhấn nút
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black, // Màu nền nút
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcATop,
              ),
              child: SvgPicture.asset(
                AppAsset.user,
                width: 15.0,
                height: 15.0,
              ),
            ),
            //const SizedBox(width: 10),
            const Text(
              "Follow",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ), // Biểu tượng
      ),
    );
  }
}

class FollowButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FollowButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 94,
      height: 22,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcATop,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAsset.user,
                  width: 12,
                  height: 12,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Text(
                  "Follow",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MenuButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: IconButton(
        onPressed: onPressed,
        icon: ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Colors.black,
            BlendMode.srcATop,
          ),
          child: SvgPicture.asset(
            AppAsset.menu,
            width: 30,
            height: 30,
          ),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }
}
