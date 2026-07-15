import 'package:flutter/material.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🏨 Hotels")),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.hotel),
            title: Text("Quality Inn & Suites"),
            subtitle: Text("Bristol, VA"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.hotel),
            title: Text("Best Western Suites Near Opryland"),
            subtitle: Text("Nashville, TN"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.hotel),
            title: Text("Holiday Inn & Suites"),
            subtitle: Text("Memphis, TN"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.hotel),
            title: Text("Holiday Inn & Suites"),
            subtitle: Text("Huntsville, AL"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.hotel),
            title: Text("Crowne Plaza"),
            subtitle: Text("Greenville, SC"),
          ),
        ],
      ),
    );
  }
}
