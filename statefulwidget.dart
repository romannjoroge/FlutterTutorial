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

class MyButton extends StatefulWidget {
  const MyButton();

  @override
  MyButtonState createState() => MyButtonState();
}

class MyButtonState extends State<MyButton> {
  int counter = 0;
  MyButtonState();
