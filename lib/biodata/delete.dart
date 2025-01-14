import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeleteBiodata extends StatefulWidget {
  final Map biodata;
  const DeleteBiodata({super.key, required this.biodata});

  @override
  State<DeleteBiodata> createState() => _DeleteBiodataState();
}

class _DeleteBiodataState extends State<DeleteBiodata> {
  Future<void> _deleteData() async {
    final response = await http.delete(
      Uri.parse('http://php.test:8080/api/delete.php'),
      body: jsonEncode({'id': widget.biodata['id'].toString()}),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data deleted successfully')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Failed to delete data: ${response.statusCode}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        title: const Text('Delete Biodata'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Are you sure you want to delete this data?',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _deleteData,
              child: const Text('Delete'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
