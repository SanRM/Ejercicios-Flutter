import 'package:flutter/material.dart';
import 'package:ch8_drawer/widgets/menu_list_tile.dart';

class RightDraweWidget extends StatelessWidget {
  const RightDraweWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const[
          DrawerHeader(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.cyan
            ),
            child: Icon(
              Icons.face,
              size: 128,
              color: Colors.white54,
            ),
          ),
          MenuListTileWidget()
        ],
      ),
    );
  }
}