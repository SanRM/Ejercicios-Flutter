import 'package:flutter/material.dart';

class SliverGridWidget extends StatelessWidget {
  const SliverGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.child_friendly,
                      size: 48,
                      color: Colors.amber,
                    ),
                    const Divider(),
                    Text('Grid ${index + 1}')
                  ],
                ),
              );
            },
            childCount: 12,
          ),
        );
  }
}
