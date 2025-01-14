import 'package:flutter/material.dart';
import 'package:flutter_tes/create.dart';
import 'package:flutter_tes/database_instance.dart';
import 'package:flutter_tes/product_model.dart';
import 'package:flutter_tes/update.dart';

class Database extends StatefulWidget {
  const Database({super.key});
  @override
  State<Database> createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {
  DatabaseInstance? databaseInstance;
  Future _refresh() async {
    setState(() {});
  }

  Future initDatabase() async {
    await databaseInstance!.database();
    setState(() {});
  }

  Future delete(int id) async {
    await databaseInstance!.delete(id);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    databaseInstance = DatabaseInstance();
    initDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Simple'),
        backgroundColor: const Color.fromARGB(255, 59, 193, 255),
        actions: [
          IconButton(
              onPressed: () {
                //mengarahkan ke halaman create
                Navigator.push(context, MaterialPageRoute(builder: (builder) {
                  return CreateScreen();
                })).then((value) {
                  setState(() {});
                });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: databaseInstance != null
            ? FutureBuilder<List<ProductModel>>(
                future: databaseInstance!.all(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.length == 0) {
                      return Center(
                        child: Text('Data masih kosong.'),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: ListTile(
                              title: Text(snapshot.data![index].name ?? ''),
                              subtitle:
                                  Text(snapshot.data![index].category ?? ''),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      //mengarahkan ke halaman update
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (builder) {
                                        return UpdateScreen(
                                          productModel: snapshot.data![index],
                                        );
                                      })).then((value) {
                                        setState(() {});
                                      });
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        delete(snapshot.data![index].id!),
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return Center(
                        child: CircularProgressIndicator(color: Colors.green));
                  }
                },
              )
            : Center(child: CircularProgressIndicator(color: Colors.green)),
      ),
    );
  }
}
