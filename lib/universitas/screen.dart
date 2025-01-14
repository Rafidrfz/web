import 'package:flutter/material.dart';
import 'package:flutter_tes/universitas/detail.dart';
import 'package:flutter_tes/universitas/universitas.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<University> _displayedList = universityList;
  List<University> _favoriteList = [];
  String _searchText = '';

  void _updateSearchResults(String searchText) {
    setState(() {
      _searchText = searchText.toLowerCase();
      _displayedList = universityList
          .where((campus) =>
              campus.name.toLowerCase().contains(_searchText) ||
              campus.location.toLowerCase().contains(_searchText))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "Daftar Universitas Bogor",
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
                      title: const Text("Kampus Favorit"),
                      centerTitle: true,
                      backgroundColor: Colors.indigo,
                    ),
                    body: ListView.builder(
                      itemCount: _favoriteList.length,
                      itemBuilder: (context, index) {
                        final University campus = _favoriteList[index];
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
                                    campus: campus,
                                    isFavorite: _favoriteList.contains(campus),
                                    onFavoriteChanged: (isNowFavorite) {
                                      setState(() {
                                        if (isNowFavorite) {
                                          _favoriteList.add(campus);
                                        } else {
                                          _favoriteList.remove(campus);
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
                                        campus.imageAsset,
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
                                          campus.name,
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          campus.location,
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
                labelText: 'Cari Kampus',
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
                final University campus = _displayedList[index];
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
                          campus.imageAsset,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      campus.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      campus.location,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        _favoriteList.contains(campus)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: _favoriteList.contains(campus)
                            ? Colors.red
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_favoriteList.contains(campus)) {
                            _favoriteList.remove(campus);
                          } else {
                            _favoriteList.add(campus);
                          }
                        });
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            campus: campus,
                            isFavorite: _favoriteList.contains(campus),
                            onFavoriteChanged: (isNowFavorite) {
                              setState(() {
                                if (isNowFavorite) {
                                  _favoriteList.add(campus);
                                } else {
                                  _favoriteList.remove(campus);
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
