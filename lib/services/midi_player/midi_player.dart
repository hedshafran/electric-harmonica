import 'package:flutter_midi_pro/flutter_midi_pro.dart';

class MidiPlayerManager {
  static final _midiPro = MidiPro();
  static final MidiPlayerManager _instance = MidiPlayerManager._internal();

  factory MidiPlayerManager() {
    return _instance;
  }

  MidiPlayerManager._internal();

  late int _soundFontId;
  final _loadedSoundFonts = <String, int>{};

  Future<void> loadSoundFont(String assetPath) async {
    if (_loadedSoundFonts.containsKey(assetPath)) {
      _soundFontId = _loadedSoundFonts[assetPath]!;
      return;
    }

    _soundFontId =
        await _midiPro.loadSoundfont(path: assetPath, bank: 0, program: 0);
    _loadedSoundFonts[assetPath] = _soundFontId;
  }

  void playNote(int midiNote) {
    _midiPro.playNote(
        sfId: _soundFontId, channel: 0, key: midiNote, velocity: 100);
  }

  void stopNote(int midiNote) {
    _midiPro.stopNote(sfId: _soundFontId, channel: 0, key: midiNote);
  }
}
