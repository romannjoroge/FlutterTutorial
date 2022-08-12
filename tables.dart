/*
	This file shows how to use tables in flutter
	How to automatically generate table rows from JSON
*/

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Define an album
class Album{
  // An Alubum has a userId, id, title, body
  final int userId;
  final int id;
  final String title;
  final String body;
  
  // Constructor for the album
  Album(this.userId, this.id, this.title, this.body);
  
  // Create an album from a map
  Album.fromJson(Map<String, dynamic> json):
    userId = json['userId'],
    id = json['id'],
    title = json['title'],
    body = json['body'];
}

// Get a list of Albums from the internet
Future<List<Album>> fetchAlbums() async {
  // Make a get request to api and store response
  Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  var response = await http.get(url);
  
  // If response successful get response body
  if (response.statusCode == 200){
    // Convert body to a map
    var bodymap = jsonDecode(response.body);
    // Create a list of albums
    List<Album> albums = [];
    for (var item in bodymap){
      var album = Album.fromJson(item);
      albums.add(album);
    }
    // Return list
    return albums;
  }
  throw Exception("Couldn't get albums");
}


// Create a list of TableRows from the list of Albums
List<TableRow> createTableRows(List<Album> albums){
  // Create an empty list of TableRows
  List<TableRow> rows = [];
  // Check that list has albums
  if (albums.isEmpty){
    throw Exception('No Albums');
  }
  // Go through each album in the list
  for (var album in albums){
    // Create a TableRow with 3 cells: id, title, userId
    TableRow row = TableRow(
      children: [
        TableCell(child: Text('${album.id}')),
        TableCell(child: Text(album.title)),
        TableCell(child: Text('${album.userId}'))
      ]
    );
    // Add TableRow to list
    rows.add(row);
  }
  // Return the list
  return rows;
}

void main() {
  runApp(MyApp());
}

// Display the table
class MyAlbums extends StatefulWidget{
  @override
  MyAlbumState createState() => MyAlbumState();
}

class MyAlbumState extends State<MyAlbums>{
  late Future<List<Album>> albums;
  
  @override
  void initState(){
    super.initState();
    albums = fetchAlbums();
  }
  
  @override
  Widget build(BuildContext context){
    return FutureBuilder<List<Album>>(
      future: albums,
      builder: (context, snapshot){
        // Check if Future is done and thus has data
        if (snapshot.hasData){
          return SizedBox(
            height: 600,
            width: 1000,
            child: ListView(
              children: [
                Table(
                  border: const TableBorder(
                    horizontalInside: BorderSide(
                      width: 2,
                      color: Colors.black
                    ),
                  ),
                  children: createTableRows(snapshot.data!)
                )
              ]
            )
          );
        }
        else if(snapshot.hasError){
          ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
              content: Text(snapshot.error.toString())
            )
          );
        }
        return const CircularProgressIndicator();
      }
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tables in Flutter')
        ),
        body: MyAlbums()
      )
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0),
      child: SizedBox(
        height: 600,
        width: 400,
        child: ListView(
          children:  [
            Table(
        border: const TableBorder(
          horizontalInside: BorderSide(
            width: 2,
            color: Colors.black12
          ),
        ),
        children: const [
          TableRow(
            children: [
              TableCell(child: Text('Number')),
              TableCell(child: Text('First Name')),
              TableCell(child: Text('Last Name'))
            ]
          ),
          TableRow(
            children: [
              TableCell(child: Text('1')),
              TableCell(child: Text('Roman')),
              TableCell(child: Text('Njoroge')),
            ]
          ),
          TableRow(
            children: [
              TableCell(child: Text('2')),
              TableCell(child: Text('James')),
              TableCell(child: Text('Muvea'))
            ]
          )
        ]
      )
          ]
        )
      )
    );
  }
}
