import 'package:audioplayers/audioplayers.dart';

class AudioPlayerManager {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> preload(String assetPath) async {
    await _audioPlayer.audioCache.load(assetPath);
  }

  Future<void> playFromAsset(String assetPath) async {
    // Stop any currently playing audio first
    await _audioPlayer.stop();
    // Load and play audio from local assets
    await _audioPlayer.play(AssetSource(assetPath));
  }

  Future<void> playFromURL(String url) async {
    // Stop any currently playing audio first
    await _audioPlayer.stop();
    // Load and play audio from a network source
    await _audioPlayer.play(UrlSource(url));
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  void dispose() {
    // Properly dispose of the AudioPlayer when not in use
    _audioPlayer.dispose();
  }
}
