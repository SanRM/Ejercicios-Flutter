import 'package:ch9_gridview/widgets/gridview_builder.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: SafeArea(
        child: GridViewBuilderWidget(),
      ),
    );
  }
}