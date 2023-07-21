import 'package:ch9_gridview/classes/grid_icons.dart';
import 'package:flutter/material.dart';

class GridViewBuilderWidget extends StatelessWidget {
  GridViewBuilderWidget({Key? key});

  final List<IconData> _iconList = GridIcons().getIconList();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 35,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
      itemBuilder: (context, index) {
        print('$index');
        
        return Card(
          color: Color.fromARGB(255, 243, 243, 243),
          margin: EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              print('Row $index');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  _iconList[index],
                  size: 48,
                  color: Color.fromARGB(255, 0, 171, 194),
                ),
                Text(
                  'Index $index',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}