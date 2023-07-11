import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Inicio'),
      ),

      floatingActionButton: 
        FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 171, 100, 230), 
          onPressed: (){}, 
          child: Icon(Icons.account_circle),
        ),

      body: Container(),
      
    );
  }
}