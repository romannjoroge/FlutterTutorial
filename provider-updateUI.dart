import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyButtonState with ChangeNotifier {
  MyButtonState();

  int _counter = 0;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  int get counter => _counter;
}

class MyButton extends StatelessWidget {
  const MyButton();

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<MyButtonState>(context);

    return Container(
      alignment: Alignment.center,
      height: 100,
      width: 300,
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          TextButton(
            onPressed: counter.increment,
            child: const Text("+1"),
          ),
          SizedBox(
            height: 90,
            width: 50,
            child: Center(
              child: Text("${counter.counter}"),
            ),
          ),
          TextButton(
            onPressed: counter.decrement,
            child: const Text("-1"),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My Counter"),
        ),
        body: ChangeNotifierProvider(
          create: (context) => MyButtonState(),
          child: const MyButton(),
        ),
      ),
    );
  }
}

void main() => runApp(const MyApp());
