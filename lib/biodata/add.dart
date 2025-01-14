import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddBiodata extends StatefulWidget {
  const AddBiodata({super.key});

  @override
  State<AddBiodata> createState() => _AddBiodataState();
}

class _AddBiodataState extends State<AddBiodata> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController kelaminController = TextEditingController();
  final TextEditingController agamaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  bool _isLoading = false; // Tambahkan variabel ini

  Future<void> _addData() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true; // Nonaktifkan tombol
    });

    final response = await http.post(
      Uri.parse('http://php.test:8080/api/create.php'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        'nama': namaController.text,
        'kelamin': kelaminController.text,
        'agama': agamaController.text,
        'alamat': alamatController.text,
      }),
    );

    setState(() {
      _isLoading = false; // Aktifkan kembali tombol
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data added successfully')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add data: ${response.statusCode}')),
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
        title: const Text('Tambah Biodata'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: kelaminController,
                decoration: const InputDecoration(labelText: 'Kelamin'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kelamin tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: agamaController,
                decoration: const InputDecoration(labelText: 'Agama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Agama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: alamatController,
                decoration: const InputDecoration(labelText: 'Alamat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed:
                    _isLoading ? null : _addData, // Nonaktifkan jika loading
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Tambah'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
