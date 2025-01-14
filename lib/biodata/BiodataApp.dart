import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tes/biodata/add.dart';
import 'package:flutter_tes/biodata/edit.dart';
import 'package:flutter_tes/biodata/delete.dart';

class Biodata extends StatefulWidget {
  const Biodata({super.key});

  @override
  State<Biodata> createState() => _BiodataState();
}

class _BiodataState extends State<Biodata> {
  List _listdata = [];

  Future _getdata() async {
    try {
      final response =
          await http.get(Uri.parse('http://php.test:8080/api/read.php'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is List) {
          setState(() {
            _listdata = data;
          });
        } else {
          print("Unexpected data format");
        }
      } else {
        print("Failed to fetch data, status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        _listdata = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getdata();
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
        title: const Text("Biodata"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(7.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.add),
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddBiodata()),
                ).then((_) => _getdata());
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(7.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.refresh),
              color: Colors.blue,
              onPressed: () {
                _getdata();
              },
            ),
          ),
        ],
      ),
      body: _listdata.isNotEmpty
          ? ListView.builder(
              itemCount: _listdata.length,
              itemBuilder: ((context, index) {
                final item = _listdata[index];
                final nama = item['nama']?.isNotEmpty == true
                    ? item['nama']
                    : 'Nama tidak tersedia';
                final kelamin = item['kelamin']?.isNotEmpty == true
                    ? item['kelamin']
                    : 'Kelamin tidak tersedia';
                final agama = item['agama']?.isNotEmpty == true
                    ? item['agama']
                    : 'Agama tidak tersedia';
                final alamat = item['alamat']?.isNotEmpty == true
                    ? item['alamat']
                    : 'Alamat tidak tersedia';

                return Card(
                  child: ListTile(
                    title: Text('Nama: $nama'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kelamin: $kelamin'),
                        Text('Agama: $agama'),
                        Text('Alamat: $alamat'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditBiodata(biodata: item),
                              ),
                            ).then((_) => _getdata());
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DeleteBiodata(biodata: item),
                              ),
                            ).then((_) => _getdata());
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
