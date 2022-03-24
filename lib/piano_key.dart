import 'package:flutter/material.dart';
import 'package:flutter_midi/flutter_midi.dart';

enum KeyColor { WHITE, BLACK }

class PianoKey extends StatelessWidget {
  final KeyColor color;
  final double width;
  final int midiNote;
  final FlutterMidi flutterMidi;

  const PianoKey.white({
    required this.width,
    required this.midiNote,
    required this.flutterMidi,
  }) : this.color = KeyColor.WHITE;

  const PianoKey.black({
    required this.width,
    required this.midiNote,
    required this.flutterMidi,
  }) : this.color = KeyColor.BLACK;

  /// Send a NOTE ON message
  playNote() {
    flutterMidi.playMidiNote(midi: midiNote);
  }

  /// Send a NOTE OFF message
  stopNote() {
    flutterMidi.stopMidiNote(midi: midiNote);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => playNote(),
      onTapUp: (_) => stopNote(),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: color == KeyColor.WHITE ? Colors.white : Colors.black,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
      ),
    );
  }
}