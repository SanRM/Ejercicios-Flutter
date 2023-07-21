import 'package:ch9_stack/widgets/stack.dart';
import 'package:ch9_stack/widgets/stack_favorite.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20),
          itemCount: 7,
          itemBuilder: (context, index) {
            if (index.isEven){
              return StackWidget();
            } else {
              return StackFavoriteWidget();
            }
          },
        ),
      ),
    );
  }
}