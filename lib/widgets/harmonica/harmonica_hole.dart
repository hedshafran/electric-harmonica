import 'package:electric_harmonica/services/audio_player/audio_player.dart';
import 'package:flutter/material.dart';

class HarmonicaHole extends StatelessWidget {
  final String blowNoteAsset;
  final String drawNoteAsset;
  final String blowNoteName;
  final String drawNoteName;

  const HarmonicaHole({
    super.key,
    required this.blowNoteAsset,
    required this.drawNoteAsset,
    required this.blowNoteName,
    required this.drawNoteName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NoteButton(noteName: blowNoteName, noteAsset: blowNoteAsset),
          const SizedBox(height: 10),
          NoteButton(noteName: drawNoteName, noteAsset: drawNoteAsset),
        ],
      ),
    );
  }
}

class NoteButton extends StatefulWidget {
  final String noteName;
  final String noteAsset;

  const NoteButton({
    super.key,
    required this.noteName,
    required this.noteAsset,
  });

  @override
  State<NoteButton> createState() => _NoteButtonState();
}

class _NoteButtonState extends State<NoteButton> {
  late AudioPlayerManager _audioManager;

  @override
  void initState() {
    super.initState();
    _audioManager = AudioPlayerManager();
    _audioManager.preload(widget.noteAsset);
  }

  @override
  void dispose() {
    _audioManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontWeight: FontWeight.bold);
    bool assetAvailable = widget.noteAsset.isNotEmpty;

    return GestureDetector(
      // check if the asset is available before playing
      onTapDown: (_) => assetAvailable ? _audioManager.playFromAsset(widget.noteAsset) : null,
      onTapUp: (_) => _audioManager.stop(),
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: assetAvailable ? Colors.white : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(widget.noteName, style: textStyle),
      ),
    );
  }
}
