import 'package:flutter/material.dart';

class RowWithCardWidget extends StatelessWidget {
  const RowWithCardWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    //With Card widget
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.flight,
          size: 48,
          color: Colors.cyan.shade400,
        ),
        title: Text(
          'Airplane $index',
          style: const TextStyle(
              color: Color.fromARGB(255, 9, 147, 172),
              fontWeight: FontWeight.bold),
        ),
        subtitle: const Text(
          'Very Cool',
          style: TextStyle(color: Color.fromARGB(255, 44, 151, 165)),
        ),
        trailing: Text(
          '${index * 7}%',
          style: const TextStyle(color: Color.fromARGB(255, 116, 116, 116)),
        ),
        selected: true,
        onTap: () {
          print('Tapped on Row $index');
        },
      ),
    );
  }
}
