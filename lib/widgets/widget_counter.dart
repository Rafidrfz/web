// TODO Implement this library.
import 'package:flutter/material.dart';

class WidgetCounter extends StatelessWidget {
  final int counter;
  const WidgetCounter({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Counter: $counter',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}