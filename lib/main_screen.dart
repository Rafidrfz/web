import 'package:flutter/material.dart';
import 'package:flutter_tes/product.dart';
import 'package:flutter_tes/response.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<List<Product>> futureProducts;
  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: FutureBuilder<List<Product>>(
          future: futureProducts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              final product = snapshot.data!;
              return buildProducts(product);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget buildProducts(List<Product> products) => ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          child: ListTile(
            title: Text(product.title),
            subtitle: Text('\$ ${product.price.toString()}'),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(product.thumbnail),
              backgroundColor: Colors.transparent,
            ),
          ),
        );
      });
}
