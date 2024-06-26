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
    final isLoading = appState.isLoading;
    final scale = appState.scale;
    final blowNotes = scale.blowNotes;
    final drawNotes = scale.drawNotes;

    final holes = List.generate(
      10,
      (index) => HarmonicaHole(
        blowNote: blowNotes[index],
        drawNote: drawNotes[index],
      ),
    );

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: holes,
      ),
    );
  }
}
