import 'package:electric_harmonica/models/enums.dart';
import 'package:electric_harmonica/providers/app_state.dart';
import 'package:electric_harmonica/services/midi_player/midi_player.dart';
import 'package:electric_harmonica/widgets/harmonica/harmonica.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;
  final midiPlayer = MidiPlayerManager();

  @override
  void initState() {
    super.initState();
    final appState = context.read<AppState>();
    midiPlayer.loadSoundFont(appState.virtualInstrument.soundFontAssetPath);
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: Row(
          children: [
            NavigationRail(
              extended: false,
              destinations: Instrument.values
                  .map((instrument) => NavigationRailDestination(
                        icon: Image(
                            image: AssetImage(instrument.iconAssetPath),
                            width: 24,
                            height: 24),
                        label: Text(instrument.name),
                      ))
                  .toList(),
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  _onInstrumentSelected(Instrument.values[value]);
                  selectedIndex = value;
                });
              },
            ),
            Expanded(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DropdownMenu(
                              initialSelection: appState.virtualInstrument,
                              onSelected: (virtualInstrument) {
                                midiPlayer.loadSoundFont(
                                    virtualInstrument!.soundFontAssetPath);
                                appState.setVirtualInstrument(virtualInstrument);
                              },
                              dropdownMenuEntries: appState
                                  .instrument.virtualInstruments
                                  .map<DropdownMenuEntry<VirtualInsrument>>(
                                      (virtualInstrument) {
                                return DropdownMenuEntry<VirtualInsrument>(
                                    value: virtualInstrument,
                                    label: virtualInstrument.name);
                              }).toList(),
                            ),
                            const SizedBox(width: 20),
                            DropdownMenu(
                              initialSelection: appState.scale,
                              onSelected: (scale) {
                                appState.setScale(scale!);
                              },
                              dropdownMenuEntries: Scale.values
                                  .map<DropdownMenuEntry<Scale>>((scale) {
                                return DropdownMenuEntry<Scale>(
                                    value: scale, label: scale.name);
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(child: Harmonica()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Future<void> _onInstrumentSelected(Instrument instrument) async {
    final appState = context.read<AppState>();
    appState.setInstrument(instrument);
    appState.setVirtualInstrument(instrument.virtualInstruments.first);
    appState.setLoading(true);
    await midiPlayer.loadSoundFont(instrument.virtualInstruments.first.soundFontAssetPath);
    appState.setLoading(false);
  }
}
