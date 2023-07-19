import 'package:ch8_drawer/widgets/left_drawer.dart';
import 'package:ch8_drawer/widgets/right_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'), // Mostrar el nombre de la página actual en la barra de título
      ),
      drawer: const LeftDrawerWidget(),
      endDrawer: const RightDraweWidget(),
      body: const SafeArea(
        child: Center(
          child: Icon(
            Icons.home_filled,
            color: Color.fromARGB(255, 113, 193, 202),
            size: 120,
          ),
        ),
      ),

      );
    
  }
}
