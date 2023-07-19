import 'package:flutter/material.dart';
import 'package:ch8_drawer/widgets/menu_list_tile.dart';

class RightDraweWidget extends StatelessWidget {
  const RightDraweWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.face,
              size: 128,
              color: Colors.white54,
            ),
            decoration: BoxDecoration(
              color: Colors.cyan
            ),
          ),
          MenuListTileWidget()
        ],
      ),
    );
  }
}