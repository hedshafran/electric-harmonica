import 'package:electric_harmonica/models/enums.dart';
import 'package:electric_harmonica/providers/app_state.dart';
import 'package:electric_harmonica/widgets/harmonica/harmonica.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        appBar: AppBar(
          title: const Text('Electric Harmonica', style: TextStyle(color: Colors.white)),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownMenu(
                    initialSelection: appState.instrument,
                    onSelected: (instrument) {
                      appState.setInstrument(instrument!);
                    },
                    dropdownMenuEntries: Instrument.values
                        .map<DropdownMenuEntry<Instrument>>((instrument) {
                      return DropdownMenuEntry<Instrument>(
                          value: instrument,
                          label: instrument.toString().split('.').last);
                    }).toList(),
                  ),
                  const SizedBox(width: 20),
                  DropdownMenu(
                    initialSelection: appState.scale,
                    onSelected: (scale) {
                      appState.setScale(scale!);
                    },
                    dropdownMenuEntries:
                        Scale.values.map<DropdownMenuEntry<Scale>>((scale) {
                      return DropdownMenuEntry<Scale>(
                          value: scale, label: scale.name);
                    }).toList(),
                  ),
                ],
              ),
              const Expanded(child: Harmonica()),
            ],
          ),
        )));
  }
}
