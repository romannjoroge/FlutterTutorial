import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
              "Title Of The App",
            ),
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
        body: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, id) {
              return Theme(
                  data: ThemeData.light(),
                  child: const ListTile(
                    leading: Icon(Icons.train),
                    title: Text("Item "),
                  ));
            }),
      ),
    );
  }
}

void main() => runApp(const MyApp());
