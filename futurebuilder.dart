/*
  This illustrates the use of data model classes
  Making http requests
  Using JSON data
  Displaying asynchronous data in flutter
*/

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// Getting Album data from the internet
Future<Album> fetchData(id) async{
  // URL of the server
  Uri url = Uri.parse('https://jsonplaceholder.typicode.com/albums/$id');
  // Making a get request to the endpoint and storing the response
  var response = await http.get(url);
  // If the response was succesful(status code == 200)
  if (response.statusCode == 200){
    // Get the body of the response
    var responseBody = response.body;
    // Convert JSON to a map
    var mapBody = jsonDecode(responseBody);
    // Convert map into an Alubum
    var album = Album.fromJson(mapBody);
    // Return album
    return album;
  }
  // If response is unsuccesful(status code != 200) throw an error saying couldn't get message
  else{
    throw Exception("Couldn't get the album you're looking for");
  }
}

// Converting that data into an Album
// Define an Album
class Album{
  // An Album is made up of a userId, title and id
  final int userId;
  final String title;
  final int id;
  
  // Create constructor for Album that takes the arguements of album
  Album(int userId, String title, int id):
    userId = userId,
    title = title,
    id = id;
  
  // Create a constructor to make an album from a map
  Album.fromJson(Map<String, dynamic> json):
    userId = json['userId'],
    title = json['title'],
    id = json['id'];
  
  // Create a toJson method that converts the Album to a map containing variable names as keys and corresponding values
  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      "userId": userId,
      "title": title,
      "id": id
    };
  }
}


// Displaying that Album
/* Create a simple page with a title (Using FutureBuider)
   and a body containig a container with the title, userId and id of the album
*/
class MyPage extends StatelessWidget{
  // MyPage contains a body and a title
  final String title;
  final Widget body;
  
  const MyPage(this.title, this.body);
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // Build a MaterialApp with an AppBar and a Scaffold
      home: Scaffold(
        // The AppBar displays the title of the page
        appBar: AppBar(
          title: Text(
            title
          )
        ),
        // The body contains the Centered body of the page
        body: Center(
          child: body
        )
      )
    );
  }
}


// Create a widget to hold album data
// Create a stateful widget that reacts to the different states of the album call
class MyAlbum extends StatefulWidget{
  // Override the create state method
  @override
  State<MyAlbum> createState(){
    return MyAlbumState();
  }
}

// Create the state for MyAlbum
class MyAlbumState extends State<MyAlbum>{
  // Has an album
  late Future<Album> album;
  
  // The stateful widget should call the fetchAlbum function in initState() method
  @override initState(){
    // Call the initState of super
    super.initState();
    // Call future method and store in album
    album = fetchData(1);
  }
  
  // Add a build method
  @override
  Widget build(BuildContext context){
    // It should have a FutureBuilder Widget
    return FutureBuilder<Album>(
      // Provide the FutureBuilder the function to use
      future: album,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
  
}

void main() async{
  runApp(MyPage(
    'Using FutureBuider',
    MyAlbum()
  ));
}
