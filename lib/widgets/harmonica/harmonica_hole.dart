import 'package:electric_harmonica/models/enums.dart';
import 'package:electric_harmonica/services/midi_player/midi_player.dart';
import 'package:flutter/material.dart';

class HarmonicaHole extends StatelessWidget {
  final Note blowNote;
  final Note drawNote;

  const HarmonicaHole({
    super.key,
    required this.blowNote,
    required this.drawNote,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NoteButton(note: blowNote),
          const SizedBox(height: 10),
          NoteButton(note: drawNote),
        ],
      ),
    );
  }
}

class NoteButton extends StatelessWidget {
  final Note note;

  const NoteButton({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    final midiPlayer = MidiPlayerManager();
    const textStyle = TextStyle(fontWeight: FontWeight.bold);

    return GestureDetector(
      // check if the asset is available before playing
      onTapDown: (_) => midiPlayer.playNote(note.midiNote),
      onTapUp: (_) => midiPlayer.stopNote(note.midiNote),
      onTapCancel: () => midiPlayer.stopNote(note.midiNote),
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(note.name, style: textStyle),
      ),
    );
  }
}
