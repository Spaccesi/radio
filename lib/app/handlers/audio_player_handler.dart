import 'package:audioplayers/audioplayers.dart';

class AudioPlayerHandler {
  final player = AudioPlayer();

  Future<void> play(String source) async {
    if (player.source != null) {
      await player.release();
    }
    await player.setSource(UrlSource(source));
    return player.play(UrlSource(source));
  }

  Future<void> pause() async {
    return player.pause();
  }
}
