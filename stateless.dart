import 'package:flutter/material.dart';

class AppBar extends StatelessWidget {
  final String title;
  const AppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 50,
      color: Colors.blue[300],
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
      ]),
    );
  }
}

class AppScaffold extends StatelessWidget {
  const AppScaffold();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: const [
          AppBar(title: "Welcome to My App!"),
        ],
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: AppScaffold()));
