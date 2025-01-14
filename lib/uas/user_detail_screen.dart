import 'package:flutter/material.dart';
import 'user_detail_model.dart'; // Gunakan model UserDetail
import 'api_service.dart';

class UserDetailScreen extends StatefulWidget {
  final String username;

  const UserDetailScreen({Key? key, required this.username}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  late Future<UserDetail> futureUserDetail;

  @override
  void initState() {
    super.initState();
    futureUserDetail = fetchUserDetail(widget.username); // Fetch user detail
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
        backgroundColor: Colors.cyan[700],
        elevation: 5,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: FutureBuilder<UserDetail>(
            future: futureUserDetail,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                final userDetail = snapshot.data!;
                return buildUserDetail(userDetail); // Menggunakan UserDetail
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return const Text('No data available');
            },
          ),
        ),
      ),
    );
  }

  Widget buildUserDetail(UserDetail userDetail) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(userDetail.avatarUrl),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              userDetail.login,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'Followers: ${userDetail.followers} | Following: ${userDetail.following}',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(color: Colors.white),
          const SizedBox(height: 8),
          Text(
            'GitHub Links:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          buildLink('Profile', userDetail.htmlUrl),
          buildLink('Gists', userDetail.gistsUrl),
          buildLink('Repositories', userDetail.reposUrl),
          buildLink('Subscriptions', userDetail.subscriptionsUrl),
          buildLink('Organizations', userDetail.organizationsUrl),
          buildLink('Events', userDetail.eventsUrl),
          buildLink('Received Events', userDetail.receivedEventsUrl),
        ],
      ),
    );
  }

  Widget buildLink(String title, String url) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade700,
          ),
        ),
        subtitle: Text(
          url,
          style: TextStyle(
            color: Colors.blue.shade600,
          ),
        ),
        onTap: () {
          // Implement URL launching functionality here
        },
      ),
    );
  }
}
