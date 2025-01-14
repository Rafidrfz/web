import 'package:flutter/material.dart';
import 'package:flutter_tes/uts/mahasiswa.dart';

class DetailScreen extends StatelessWidget {
  final Student student;
  final bool isFavorite;
  final ValueChanged<bool> onFavoriteChanged;

  const DetailScreen({
    super.key,
    required this.student,
    required this.isFavorite,
    required this.onFavoriteChanged,
  });

  @override
  Widget build(BuildContext context) {
    const informationTextStyle = TextStyle(fontFamily: 'Oxygen');

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Center(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.asset(
                                  student.imageasset,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child: Text('Gambar tidak dapat dimuat'),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage(student.imageasset),
                      radius: 60,
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            onFavoriteChanged(!isFavorite);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                student.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.green,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            // Section Contact
            _buildSection(
              title: "Contact",
              child: Column(
                children: [
                  _buildContactRow(Icons.email, 'Email', student.email),
                  const Divider(),
                  _buildContactRow(Icons.phone, 'Phone', student.phone),
                  const Divider(),
                  _buildContactRow(
                      Icons.location_on, 'Address', student.address),
                ],
              ),
            ),
            // Section Skill
            _buildSection(
              title: "Skill",
              child: Column(
                children: [
                  _buildSkillRow('PHP', 0.8),
                  _buildSkillRow('Flutter', 0.7),
                  _buildSkillRow('Photoshop', 0.9),
                ],
              ),
            ),
            // Section About Me
            _buildSection(
              title: "About Me",
              child: const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin auctor sit amet lectus ut accumsan. Ut tincidunt, elit vel malesuada tristique, odio lorem posuere eros, vitae fermentum velit urna a velit.",
                style: TextStyle(fontFamily: 'Oxygen', color: Colors.black87),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to create each section with title
  Widget _buildSection({required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8.0),
          child,
        ],
      ),
    );
  }

  // Helper to create each contact row
  Widget _buildContactRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.pink[300], size: 24),
        const SizedBox(width: 12.0),
        Text(
          '$label:',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(color: Colors.black54),
          ),
        ),
      ],
    );
  }

  // Helper to create each skill row
  Widget _buildSkillRow(String skill, double level) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(skill),
          const SizedBox(height: 4.0),
          LinearProgressIndicator(
            value: level,
            backgroundColor: Colors.grey[300],
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
