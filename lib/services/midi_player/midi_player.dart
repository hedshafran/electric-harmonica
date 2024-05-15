import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';

class MidiPlayerManager {
  MidiPlayerManager() {
    FlutterMidi().unmute(); // Ensure the MIDI isn't muted
  }

  Future<void> loadSoundFont(String assetPath) async {
    try {
      ByteData byte = await rootBundle.load(assetPath);
      await FlutterMidi().prepare(sf2: byte, name: assetPath);
      print("SoundFont loaded successfully.");
    } catch (e) {
      print("Failed to load SoundFont: $e");
    }
  }

  void playNote(int midiNote) {
    FlutterMidi().playMidiNote(midi: midiNote);
  }

  void stopNote(int midiNote) {
    FlutterMidi().stopMidiNote(midi: midiNote);
  }
}
