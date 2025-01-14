import 'package:flutter/material.dart';
import 'dart:math';

class Bigger extends StatefulWidget {
  final String text;
  const Bigger({super.key, required this.text});

  @override
  _BiggerTextState createState() => _BiggerTextState();
}

class _BiggerTextState extends State<Bigger> {
  double _fontSize = 16.0;
  String _displayText = 'Hello world!';
  Color _textColor = Colors.black;

  void _increaseFontSize() {
    setState(() {
      _fontSize += 5.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      if (_fontSize > 5) {
        _fontSize -= 5.0;
      }
    });
  }

  void _gantinama() {
    setState(() {
      _displayText = 'Hello Rafid Rafauzi';
    });
  }

  void _reset() {
    setState(() {
      _fontSize = 16.0;
      _displayText = 'Hello world!';
      _textColor = Colors.black;
    });
  }

  void _changeTextColor() {
    setState(() {
      _textColor =
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _displayText,
              style: TextStyle(
                fontSize: _fontSize,
                color: _textColor,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _increaseFontSize,
                  child: const Text("Perbesar"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _decreaseFontSize,
                  child: const Text("Perkecil"),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _gantinama,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  child: Text('Ganti Nama'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _reset,
                  child: const Text('Reset'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _changeTextColor,
                  child: const Text('Ubah Warna'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Bigger(text: "Hello, world!"),
  ));
}
