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
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NoteButton(note: blowNote),
          NoteButton(note: drawNote),
        ],
      ),
    );
  }
}

class NoteButton extends StatefulWidget {
  final Note note;

  const NoteButton({
    super.key,
    required this.note,
  });

  @override
  State<NoteButton> createState() => _NoteButtonState();
}

class _NoteButtonState extends State<NoteButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final midiPlayer = MidiPlayerManager();
    const textStyle = TextStyle(fontWeight: FontWeight.bold);

    return Expanded(
      child: GestureDetector(
        onTapDown: (_) {
          setState(() => _isPressed = true);
          midiPlayer.playNote(widget.note.midiNote);
        },
        onTapUp: (_) {
          setState(() => _isPressed = false);
          midiPlayer.stopNote(widget.note.midiNote);
        },
        onTapCancel: () {
          setState(() => _isPressed = false);
          midiPlayer.stopNote(widget.note.midiNote);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _isPressed ? Colors.grey.shade100 : Colors.white,
            border: Border.all(color: Colors.grey),
          ),
          child: Text(widget.note.name, style: textStyle),
        ),
      ),
    );
  }
}
