import 'dart:convert';
import 'package:flutter_tes/product.dart';
import 'package:http/http.dart' as http;

const url = 'https://dummyjson.com/products';
Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse(url));
  final body = json.decode(response.body);

  if (response.statusCode == 200) {
    return body['products'].map<Product>(Product.fromJson).toList();
  } else {
    throw Exception('Failed to load product');
  }
}
