import 'package:electric_harmonica/providers/app_state.dart';
import 'package:electric_harmonica/widgets/harmonica/harmonica_hole.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Harmonica extends StatelessWidget {
  const Harmonica({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final instrument = appState.instrument;
    final scale = appState.scale;
    final blowNotes = scale.blowNotes;
    final drawNotes = scale.drawNotes;

    final blowNotesAssets = blowNotes
        .map((note) => instrument.notesAssets[note] ?? '')
        .toList();
    final drawNotesAssets = drawNotes
        .map((note) => instrument.notesAssets[note] ?? '')
        .toList();

    final holes = List.generate(
      10,
      (index) => HarmonicaHole(
        blowNoteAsset: blowNotesAssets[index],
        drawNoteAsset: drawNotesAssets[index],
        blowNoteName: blowNotes[index].name,
        drawNoteName: drawNotes[index].name,
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: holes,
    );
  }
}
