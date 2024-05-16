import 'package:electric_harmonica/models/enums.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isLoading = false;

  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  Instrument _instrument = Instrument.Piano;

  Instrument get instrument => _instrument;

  void setInstrument(Instrument instrument) {
    _instrument = instrument;
    notifyListeners();
  }

  VirtualInsrument _virtualInstrument = VirtualInsrument.NineFootGrand;

  VirtualInsrument get virtualInstrument => _virtualInstrument;

  void setVirtualInstrument(VirtualInsrument virtualInstrument) {
    _virtualInstrument = virtualInstrument;
    notifyListeners();
  }

  Scale _scale = Scale.C;

  Scale get scale => _scale;

  void setScale(Scale scale) {
    _scale = scale;
    notifyListeners();
  }
}
