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

  // Function to increment  counter
  void increment_counter() {
    if (counter >= 10) {
      counter = 0;
    } else {
      counter++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$counter",
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        IconButton(
            icon: const Icon(Icons.add),
            tooltip: "Increment counter by 1",
            onPressed: () {
              setState(increment_counter);
            }),
      ],
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
          MyButton(),
        ],
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: AppScaffold()));
