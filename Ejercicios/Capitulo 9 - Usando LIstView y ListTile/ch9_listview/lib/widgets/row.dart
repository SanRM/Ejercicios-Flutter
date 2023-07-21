import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {

    //Without Card widget
    return ListTile(
      leading: const Icon(
        Icons.directions_car,
        size: 48,
        color: Color.fromARGB(255, 255, 137, 176),
      ),
      title: Text('Car $index'),
      subtitle: const Text('Very Cool'),
      trailing: (index % 3).isEven ? Icon(Icons.bookmark_border) : Icon(Icons.bookmark),
      selected: false,
      onTap: () {
        print('Tapped on Row $index');
      },
    );
  }
}