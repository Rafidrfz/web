import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo2 extends StatefulWidget {
  const SharedPreferencesDemo2({super.key});

  @override
  State<SharedPreferencesDemo2> createState() => _SharedPreferencesDemo2State();
}

class _SharedPreferencesDemo2State extends State<SharedPreferencesDemo2> {
  int counter = 0;
  bool isDark = false;

  // Save preferences
  Future<void> setPreference() async {
    final prefs = await SharedPreferences.getInstance();

    // If 'myData' already exists, clear it (optional)
    if (prefs.containsKey('myData')) {
      prefs.clear();
    }

    // Encode data to store
    final myData = json.encode({
      'counter': counter.toString(),
      'isDark': isDark.toString(),
    });

    // Save data to SharedPreferences
    prefs.setString('myData', myData);
    setState(() {});
  }

  // Retrieve preferences
  Future<void> getPreference() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('myData')) {
      final myData = json.decode(prefs.getString('myData')!) as Map<String, dynamic>;
      counter = int.parse(myData["counter"]);
      isDark = myData["isDark"] == "true";
    }
  }

  // Methods for button actions
  void minus() {
    counter--;
    setPreference();
  }

  void add() {
    counter++;
    setPreference();
  }

  void changeTheme() {
    isDark = !isDark;
    setPreference();
  }

  void refresh() {
    counter = 0;
    isDark = false;
    setPreference();
  }

  // Define dark theme
  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    primarySwatch: Colors.amber,
    primaryColorDark: Colors.amber,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(
          color: Colors.white,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
  );

  // Define light theme
  ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.amber,
    primarySwatch: Colors.amber,
    primaryColorLight: Colors.amber,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: BorderSide(
          color: Colors.black,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPreference(),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: isDark ? dark : light,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Counter Apps"),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: refresh,
              ),
            ],
            backgroundColor: const Color.fromARGB(255, 246, 97, 174),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Angka saat ini adalah : $counter",
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: minus,
                      child: const Icon(Icons.remove),
                    ),
                    OutlinedButton(
                      onPressed: add,
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: changeTheme,
            child: const Icon(Icons.color_lens),
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}