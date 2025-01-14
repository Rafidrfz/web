import 'package:flutter/material.dart';

class SumScreen extends StatefulWidget {
  @override
  _SumScreenState createState() => _SumScreenState();
}

class _SumScreenState extends State<SumScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _result = '';

  void _calculateSum() {
    final int? number1 = int.tryParse(_controller1.text);
    final int? number2 = int.tryParse(_controller2.text);

    if (number1 != null && number2 != null) {
      final int sum = number1 + number2;
      setState(() {
        _result = 'Hasil Penjumlahan: $sum';
      });
    } else {
      setState(() {
        _result = 'Masukkan angka yang valid!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penjumlahan Dua Angka'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka Pertama',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka Kedua',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateSum,
              child: Text('Hitung Penjumlahan'),
            ),
            SizedBox(height: 16),
            Text(
              _result,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
