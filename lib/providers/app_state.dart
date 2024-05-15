import 'package:electric_harmonica/models/enums.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  Instrument _instrument = Instrument.Flute;

  Instrument get instrument => _instrument;

  void setInstrument(Instrument instrument) {
    _instrument = instrument;
    notifyListeners();
  }

  Scale _scale = Scale.C;

  Scale get scale => _scale;

  void setScale(Scale scale) {
    _scale = scale;
    notifyListeners();
  }
}
