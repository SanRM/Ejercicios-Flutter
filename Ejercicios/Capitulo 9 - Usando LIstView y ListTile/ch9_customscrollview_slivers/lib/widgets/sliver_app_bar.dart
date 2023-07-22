import 'package:flutter/material.dart';

class SilverAppBarWidget extends StatelessWidget {
  const SilverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.brown,
      forceElevated: true,
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Parallax Effect', style: TextStyle(color: Color.fromARGB(176, 0, 0, 0)),),
        centerTitle: true,
        background: Image(
          image: AssetImage('assets/images/desk.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}