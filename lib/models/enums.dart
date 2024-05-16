// ignore_for_file: constant_identifier_names

enum Note {
  C4('C4', 60),
  Cs4('C♯4', 61),
  Df4('D♭4', 61),
  D4('D4', 62),
  Ds4('D♯4', 63),
  Ef4('E♭4', 63),
  E4('E4', 64),
  F4('F4', 65),
  Fs4('F♯4', 66),
  Gf4('G♭4', 66),
  G4('G4', 67),
  Gs4('G♯4', 68),
  Af4('A♭4', 68),
  A4('A4', 69),
  As4('A♯4', 70),
  Bf4('B♭4', 70),
  B4('B4', 71),
  C5('C5', 72),
  Cs5('C♯5', 73),
  Df5('D♭5', 73),
  D5('D5', 74),
  Ds5('D♯5', 75),
  Ef5('E♭5', 75),
  E5('E5', 76),
  Es5('E♯5', 77),
  F5('F5', 77),
  Fs5('F♯5', 78),
  Gf5('G♭5', 78),
  G5('G5', 79),
  Gs5('G♯5', 80),
  Af5('A♭5', 80),
  A5('A5', 81),
  As5('A♯5', 82),
  Bf5('B♭5', 82),
  B5('B5', 83),
  C6('C6', 84),
  Cs6('C♯6', 85),
  Df6('D♭6', 85),
  D6('D6', 86),
  Ds6('D♯6', 87),
  Ef6('E♭6', 87),
  E6('E6', 88),
  Es6('E♯6', 89),
  F6('F6', 89),
  Fs6('F♯6', 90),
  Gf6('G♭6', 90),
  G6('G6', 91),
  Gs6('G♯6', 92),
  Af6('A♭6', 92),
  A6('A6', 93),
  As6('A♯6', 94),
  Bf6('B♭6', 94),
  B6('B6', 95),
  C7('C7', 96),
  Cs7('C♯7', 97),
  Df7('D♭7', 97),
  D7('D7', 98),
  Ds7('D♯7', 99),
  Ef7('E♭7', 99),
  E7('E7', 100),
  F7('F7', 101),
  Fs7('F♯7', 102),
  Gf7('G♭7', 102),
  G7('G7', 103),
  Gs7('G♯7', 104),
  Af7('A♭7', 104),
  A7('A7', 105),
  As7('A♯7', 106),
  Bf7('B♭7', 106),
  B7('B7', 107);

  const Note(this.name, this.midiNote);
  final String name;
  final int midiNote;
}

enum Scale {
  C('C', [
    Note.C4,
    Note.E4,
    Note.G4,
    Note.C5,
    Note.E5,
    Note.G5,
    Note.C6,
    Note.E6,
    Note.G6,
    Note.C7,
  ], [
    Note.D4,
    Note.G4,
    Note.B4,
    Note.D5,
    Note.F5,
    Note.A5,
    Note.B5,
    Note.D6,
    Note.F6,
    Note.A6,
  ]),
  Df('D♭', [
    Note.Df4,
    Note.F4,
    Note.Af4,
    Note.Df5,
    Note.F5,
    Note.Af5,
    Note.Df6,
    Note.F6,
    Note.Af6,
    Note.Df7,
  ], [
    Note.Ef4,
    Note.Af4,
    Note.C5,
    Note.Ef5,
    Note.Gf5,
    Note.Bf5,
    Note.C6,
    Note.Ef6,
    Note.Gf6,
    Note.Bf6,
  ]),
  D('D', [
    Note.D4,
    Note.Fs4,
    Note.A4,
    Note.D5,
    Note.Fs5,
    Note.A5,
    Note.D6,
    Note.Fs6,
    Note.A6,
    Note.D7,
  ], [
    Note.E4,
    Note.A4,
    Note.Cs5,
    Note.E5,
    Note.G5,
    Note.B5,
    Note.Cs6,
    Note.E6,
    Note.G6,
    Note.B6,
  ]),
  Ef('E♭', [
    Note.Ef4,
    Note.G4,
    Note.Bf4,
    Note.Ef5,
    Note.G5,
    Note.Bf5,
    Note.Ef6,
    Note.G6,
    Note.Bf6,
    Note.Ef7,
  ], [
    Note.F4,
    Note.Bf4,
    Note.D5,
    Note.F5,
    Note.Af5,
    Note.C6,
    Note.D6,
    Note.F6,
    Note.Af6,
    Note.C7,
  ]),
  E('E', [
    Note.E4,
    Note.Gs4,
    Note.B4,
    Note.E5,
    Note.Gs5,
    Note.B5,
    Note.E6,
    Note.Gs6,
    Note.B6,
    Note.E7,
  ], [
    Note.Fs4,
    Note.B4,
    Note.Ds5,
    Note.Fs5,
    Note.A5,
    Note.Cs6,
    Note.Ds6,
    Note.Fs6,
    Note.A6,
    Note.Cs7,
  ]),
  F('F', [
    Note.F4,
    Note.A4,
    Note.C5,
    Note.F5,
    Note.A5,
    Note.C6,
    Note.F6,
    Note.A6,
    Note.C7,
    Note.F7,
  ], [
    Note.G4,
    Note.C5,
    Note.E5,
    Note.G5,
    Note.Bf5,
    Note.D6,
    Note.E6,
    Note.G6,
    Note.Bf6,
    Note.D7,
  ]),
  Fs('F♯', [
    Note.Fs4,
    Note.As4,
    Note.Cs5,
    Note.Fs5,
    Note.As5,
    Note.Cs6,
    Note.Fs6,
    Note.As6,
    Note.Cs7,
    Note.Fs7,
  ], [
    Note.Gs4,
    Note.Cs5,
    Note.Es5,
    Note.Gs5,
    Note.B5,
    Note.Ds6,
    Note.Es6,
    Note.Gs6,
    Note.B6,
    Note.Ds7,
  ]),
  G('G', [
    Note.G4,
    Note.B4,
    Note.D5,
    Note.G5,
    Note.B5,
    Note.D6,
    Note.G6,
    Note.B6,
    Note.D7,
    Note.G7,
  ], [
    Note.A4,
    Note.D5,
    Note.Fs5,
    Note.A5,
    Note.C6,
    Note.E6,
    Note.Fs6,
    Note.A6,
    Note.C7,
    Note.E7,
  ]),
  Af('A♭', [
    Note.Af4,
    Note.C5,
    Note.Ef5,
    Note.Af5,
    Note.C6,
    Note.Ef6,
    Note.Af6,
    Note.C7,
    Note.Ef7,
    Note.Af7,
  ], [
    Note.Bf4,
    Note.Ef5,
    Note.G5,
    Note.Bf5,
    Note.Df6,
    Note.F6,
    Note.G6,
    Note.Bf6,
    Note.Df7,
    Note.F7,
  ]),
  A('A', [
    Note.A4,
    Note.Cs5,
    Note.E5,
    Note.A5,
    Note.Cs6,
    Note.E6,
    Note.A6,
    Note.Cs7,
    Note.E7,
    Note.A7,
  ], [
    Note.B4,
    Note.E5,
    Note.Gs5,
    Note.B5,
    Note.D6,
    Note.Fs6,
    Note.Gs6,
    Note.B6,
    Note.D7,
    Note.Fs7,
  ]),
  Bf('B♭', [
    Note.Bf4,
    Note.D5,
    Note.F5,
    Note.Bf5,
    Note.D6,
    Note.F6,
    Note.Bf6,
    Note.D7,
    Note.F7,
    Note.Bf7,
  ], [
    Note.C5,
    Note.F5,
    Note.A5,
    Note.C6,
    Note.Ef6,
    Note.G6,
    Note.A6,
    Note.C7,
    Note.Ef7,
    Note.G7,
  ]),
  B('B', [
    Note.B4,
    Note.Ds5,
    Note.Fs5,
    Note.B5,
    Note.Ds6,
    Note.Fs6,
    Note.B6,
    Note.Ds7,
    Note.Fs7,
    Note.B7,
  ], [
    Note.Cs5,
    Note.Fs5,
    Note.As5,
    Note.Cs6,
    Note.E6,
    Note.Gs6,
    Note.As6,
    Note.Cs7,
    Note.E7,
    Note.Gs7,
  ]);

  const Scale(this.name, this.blowNotes, this.drawNotes);
  final String name;
  final List<Note> blowNotes;
  final List<Note> drawNotes;
}

enum VirtualInsrument {
  NineFootGrand('Nine-foot Grand', 'assets/soundfonts/piano/nine-foot-grand-piano.sf2'),
  PianoAndStrings('Piano and Strings', 'assets/soundfonts/piano/piano-and-strings.sf2'),
  RockOrgan('Rock Organ', 'assets/soundfonts/piano/rock-organ.sf2'),
  Harmonica('Harmonica', 'assets/soundfonts/harmonica/astral-harmonica.sf2'),
  Violin('Violin', 'assets/soundfonts/strings/violin.sf2');

  const VirtualInsrument(this.name, this.soundFontAssetPath);
  final String name;
  final String soundFontAssetPath;
}

enum Instrument {
  Piano('Piano', 'assets/icons/piano.png', [VirtualInsrument.NineFootGrand, VirtualInsrument.PianoAndStrings, VirtualInsrument.RockOrgan]),
  Harmonica('Harmonica', 'assets/icons/harmonica.png', [VirtualInsrument.Harmonica]),
  Strings('Strings', 'assets/icons/cello.png', [VirtualInsrument.Violin]);

  const Instrument(this.name, this.iconAssetPath, this.virtualInstruments);
  final String name;
  final String iconAssetPath;
  final List<VirtualInsrument> virtualInstruments;
}
