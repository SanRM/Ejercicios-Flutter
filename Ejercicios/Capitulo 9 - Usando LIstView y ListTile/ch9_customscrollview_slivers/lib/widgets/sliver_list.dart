import 'package:flutter/material.dart';

class SliverListWidget extends StatelessWidget {
  const SliverListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        List.generate(3, (index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
                backgroundColor: Colors.lightBlue,
                foregroundColor: Color.fromARGB(255, 0, 44, 65),
              ),
              title: Text('Row ${index + 1}'),
              subtitle: Text('Subtitle Row ${index + 1}'),
              trailing: Icon(Icons.star_border),
            );
          }
        )
      )
    );
  }
}
