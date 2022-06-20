import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text("Title Of The App",
                style: TextStyle(
                  color: Colors.white,
                )),
            actions: const [
              IconButton(
                icon: Icon(Icons.info),
                onPressed: null,
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: null,
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: null,
              ),
            ]),
        drawer: Drawer(
          child: ListView(children: const [
            ListTile(
              leading: Icon(Icons.train),
              title: Text("Train"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Car"),
            ),
          ]),
        ),
      ),
    );
  }
}

void main() => runApp(const MyApp());
