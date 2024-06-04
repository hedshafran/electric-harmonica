import 'package:audioplayers/audioplayers.dart';

class AudioPlayerManager {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> preload(String assetPath) async {
    await _audioPlayer.audioCache.load(assetPath);
  }

  Future<void> playFromAsset(String assetPath) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(assetPath));
  }

  Future<void> playFromURL(String url) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(UrlSource(url));
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
