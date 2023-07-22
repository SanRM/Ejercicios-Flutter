import 'package:ch9_customscrollview_slivers/widgets/sliver_app_bar.dart';
import 'package:ch9_customscrollview_slivers/widgets/sliver_grid.dart';
import 'package:ch9_customscrollview_slivers/widgets/sliver_list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        elevation: 0,
      ),
      body: const CustomScrollView(
        slivers: [
          SilverAppBarWidget(),
          SliverListWidget(),
          SliverGridWidget()
        ],
      ),
    );
  }
}