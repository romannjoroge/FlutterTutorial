import 'package:flutter/material.dart';

class MyCounter extends StatefulWidget {
  const MyCounter();

  @override
  MyCounterState createState() => MyCounterState();
}

class MyCounterState extends State<MyCounter> {
  late int count;
  MyCounterState();

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My Counter"),
        ),
        body: Container(
          alignment: Alignment.center,
          height: 100,
          width: 300,
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() => count++);
                },
                child: const Text("+1"),
              ),
              SizedBox(
                height: 90,
                width: 50,
                child: Center(
                  child: Text("$count"),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() => count--);
                },
                child: const Text("-1"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(const MyCounter());
