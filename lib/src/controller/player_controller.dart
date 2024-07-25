import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:radio_news/core/app_recording_data.dart';

class PlayerController extends GetxController {
  RxString recordingUrl = "null".obs;
  final AudioPlayer player = AudioPlayer();
  var isPlaying = false.obs;
  var position = Duration.zero.obs;
  var duration = Duration.zero.obs;

  PlayerController() {
    // Listen to player state changes
    player.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
    });

    // Listen to position changes
    player.positionStream.listen((pos) {
      position.value = pos;
    });

    // Listen to duration changes
    player.durationStream.listen((dur) {
      duration.value = dur ?? Duration.zero;
    });
  }

  Future<void> play() async {
    player.play();
  }

  void initialRecordingURL() {
    if (AppRecordingData.recordItems.isEmpty) {
      onClose();
    }
  }

  void setUrl(String url) {
    recordingUrl.value = url;
    player.pause();
    player.setUrl(recordingUrl.value);
    player.play();
  }

  void pause() async {
    await player.pause();
  }

  void seekTo(Duration newPosition) async {
    await player.seek(newPosition);
  }

  void seekForward() async {
    var newPosition = position.value + const Duration(seconds: 15);
    if (newPosition > duration.value) {
      newPosition = duration.value;
    }
    await player.seek(newPosition);
  }

  void seekBackward() async {
    var newPosition = position.value - const Duration(seconds: 15);
    if (newPosition < Duration.zero) {
      newPosition = Duration.zero;
    }
    await player.seek(newPosition);
  }

  void seek(Duration position) {
    player.seek(position);
  }

  void playSliderItemAudio(int index) {
    setUrl(AppRecordingData.recordItems[index].recordingUrl);
  }

  bool isAudioPlaying() {
    return isPlaying.value;
  }

  void turnOnSpeaker() {
    const double maxVolume = 1.0;
    player.setVolume(maxVolume);
  }

  void turnOffSpeaker() {
    const double minVolume = 0.0;
    player.setVolume(minVolume);
  }

  double getSpeakerValue() {
    return player.volume;
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}
