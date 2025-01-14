import 'package:flutter_tes/uas/user_detail_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user_model.dart';

// Fetch list of users
Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('https://api.github.com/users'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

// Fetch user details
Future<UserDetail> fetchUserDetail(String username) async {
  final response = await http.get(Uri.parse('https://api.github.com/users/$username'));
  if (response.statusCode == 200) {
    return UserDetail.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load user details');
  }
}
