import 'package:flutter/material.dart';
import 'package:ch8_drawer/widgets/menu_list_tile.dart';

class LeftDrawerWidget extends StatelessWidget {
  const LeftDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 325,
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          UserAccountsDrawerHeader(
            currentAccountPicture: Icon(
              Icons.face,
              size: 48,
              color: Colors.white,
            ),
            accountName: Text('Santiago R'),
            accountEmail: Text('SantiagoRomoM@hotmail.com'),
            otherAccountsPictures: [
              Icon(
                Icons.bookmark_border,
                color: Colors.white,
              ),
              Icon(
                Icons.star_border_purple500_outlined,
                color: Colors.white,
              )
            ],
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/paisaje.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          MenuListTileWidget()
        ],
      ),
    );
  }
}
