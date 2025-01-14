import 'package:flutter/material.dart';
import 'package:flutter_tes/uts/detail.dart';
import 'package:flutter_tes/uts/mahasiswa.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<Student> _displayedList = studentList;
  List<Student> _favoriteList = [];
  String _searchText = '';

  void _updateSearchResults(String searchText) {
    setState(() {
      _searchText = searchText.toLowerCase();
      _displayedList = studentList
          .where((student) =>
              student.name.toLowerCase().contains(_searchText) ||
              student.major.toLowerCase().contains(_searchText))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "Daftar Mahasiswa",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: const Text("Mahasiswa Favorit"),
                      centerTitle: true,
                      backgroundColor: Colors.indigo,
                    ),
                    body: ListView.builder(
                      itemCount: _favoriteList.length,
                      itemBuilder: (context, index) {
                        final Student student = _favoriteList[index];
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    student: student,
                                    isFavorite: _favoriteList.contains(student),
                                    onFavoriteChanged: (isNowFavorite) {
                                      setState(() {
                                        if (isNowFavorite) {
                                          _favoriteList.add(student);
                                        } else {
                                          _favoriteList.remove(student);
                                        }
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.asset(
                                        student.imageasset,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          student.name,
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          student.major,
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: _updateSearchResults,
              decoration: InputDecoration(
                labelText: 'Cari Mahasiswa',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _displayedList.length,
              itemBuilder: (context, index) {
                final Student student = _displayedList[index];
                return Card(
                  elevation: 3,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(
                          student.imageasset,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      student.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      student.major,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        _favoriteList.contains(student)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: _favoriteList.contains(student)
                            ? Colors.red
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_favoriteList.contains(student)) {
                            _favoriteList.remove(student);
                          } else {
                            _favoriteList.add(student);
                          }
                        });
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            student: student,
                            isFavorite: _favoriteList.contains(student),
                            onFavoriteChanged: (isNowFavorite) {
                              setState(() {
                                if (isNowFavorite) {
                                  _favoriteList.add(student);
                                } else {
                                  _favoriteList.remove(student);
                                }
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
