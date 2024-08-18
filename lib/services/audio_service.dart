import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class MyAudioHandler extends BaseAudioHandler {
  final AudioPlayer _player = AudioPlayer();

  MyAudioHandler() {
    _player.playerStateStream.listen((playerState) {
      playbackState.add(playbackState.value.copyWith(
        controls: [
          MediaControl.play,
          MediaControl.pause,
          MediaControl.stop,
        ],
        playing: playerState.playing,
        processingState: playerState.playing
            ? AudioProcessingState.ready
            : AudioProcessingState.none,
        position: _player.position,
        bufferedPosition: _player.bufferedPosition,
        // Note: duration might be null if not yet loaded
        // Use null-aware operator to handle this
        duration: _player.duration,
      ));
    });

    _player.positionStream.listen((position) {
      playbackState.add(playbackState.value.copyWith(position: position));
    });

    _player.durationStream.listen((duration) {
      playbackState.add(playbackState.value.copyWith(duration: duration));
    });
  }

  @override
  Future<void> play() async {
    await _player.play();
  }

  @override
  Future<void> pause() async {
    await _player.pause();
  }

  @override
  Future<void> setUrl(String url) async {
    await _player.setUrl(url);
    await _player.play();
  }

  @override
  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  @override
  Future<void> stop() async {
    await _player.stop();
  }

  @override
  Future<void> seekTo(int position) async {
    await _player.seek(Duration(milliseconds: position));
  }

  @override
  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume);
  }
}
