import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditBiodata extends StatefulWidget {
  final Map biodata;
  const EditBiodata({super.key, required this.biodata});

  @override
  State<EditBiodata> createState() => _EditBiodataState();
}

class _EditBiodataState extends State<EditBiodata> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController namaController;
  late TextEditingController kelaminController;
  late TextEditingController agamaController;
  late TextEditingController alamatController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.biodata['nama']);
    kelaminController = TextEditingController(text: widget.biodata['kelamin']);
    agamaController = TextEditingController(text: widget.biodata['agama']);
    alamatController = TextEditingController(text: widget.biodata['alamat']);
  }

  Future _editData() async {
    if (!_formKey.currentState!.validate()) return;

    final response = await http.put(
      Uri.parse('http://php.test:8080/api/update.php'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        'id': widget.biodata['id'].toString(),
        'nama': namaController.text,
        'kelamin': kelaminController.text,
        'agama': agamaController.text,
        'alamat': alamatController.text,
      }),
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data updated successfully')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Failed to update data: ${response.statusCode}')),
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
        title: const Text('Edit Biodata'),
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
                onPressed: _editData,
                child: const Text('Edit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}