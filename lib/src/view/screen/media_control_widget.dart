import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_news/src/controller/player_controller.dart';

class MediaControlWidget extends StatelessWidget {
  final PlayerController controller = Get.find<PlayerController>();

  MediaControlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() => Text(controller.recordingUrl.value,
              style: const TextStyle(color: Colors.white))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous, color: Colors.white),
                onPressed: controller.seekBackward,
              ),
              Obx(() => IconButton(
                    icon: Icon(
                        controller.isPlaying.value
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white),
                    onPressed: controller.isPlaying.value
                        ? controller.pause
                        : controller.play,
                  )),
              IconButton(
                icon: const Icon(Icons.skip_next, color: Colors.white),
                onPressed: controller.seekForward,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.volume_down, color: Colors.white),
                onPressed: controller.turnOffSpeaker,
              ),
              IconButton(
                icon: const Icon(Icons.volume_up, color: Colors.white),
                onPressed: controller.turnOnSpeaker,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
