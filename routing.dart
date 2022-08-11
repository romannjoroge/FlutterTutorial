/*
	This file shows how to use named routes in your program
*/
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget{
  final String title;
  final Widget body;
  
  const MyPage(this.title, this.body, {super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body: body
    );
  }
}

// Buttons for each route
class FirstPage extends StatelessWidget{
  // A Widget containing a button with the word second page
  const FirstPage({super.key});
  
  @override
  Widget build(BuildContext context){
    return  Center(
      child: ElevatedButton(
        // Contains the Navigation logic of the page
        onPressed: () {
          // Telling Navigator to push a route to its route stack
          Navigator.pushNamed(context, '/second');
        },
        child: const Text('Second Page')
      )
    );
  }
}

class SecondPage extends StatelessWidget{
  // Widget that is ment to take user back to the first page
  const SecondPage({super.key});
  
  @override
  Widget build(BuildContext context){
    return  Center(
      child: ElevatedButton(
        // Pop secondroute from the route stack
        onPressed: (){
          Navigator.pop(context);
        },
        child: const Text('Back to First Page')
      )
    );
  }
}

// Constructors for the routes
class FirstRoute extends StatelessWidget{
  const FirstRoute({super.key});
  
  @override
  Widget build(BuildContext context){
    return const MyPage(
      'First Page',
      FirstPage()
    );
  }
}

class SecondRoute extends StatelessWidget{
  const SecondRoute({super.key});
  
  @override
  Widget build(BuildContext context){
    return const MyPage(
      'Second Page',
      SecondPage()
    );
  }
}

void main(){
  // Always run MaterialApp in runApp
  runApp(MaterialApp(
    title: 'Navigation Basics',
    // Informing the app about the available routes
    // Define a home route(eliminates need for home property)
    initialRoute: '/',
    routes: {
      // The widget to build at the home page
      '/': (context) => const FirstRoute(),
      // The widget to build at the second page
      '/second': (context) => const SecondRoute()
    }
  ));
}
