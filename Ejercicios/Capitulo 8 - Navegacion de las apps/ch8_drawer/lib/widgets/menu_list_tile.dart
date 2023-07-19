import 'package:flutter/material.dart';
import 'package:ch8_drawer/pages/birthdays.dart';
import 'package:ch8_drawer/pages/gratitude.dart';
import 'package:ch8_drawer/pages/reminders.dart';

class MenuListTileWidget extends StatefulWidget {
  const MenuListTileWidget({super.key});

  @override
  State<MenuListTileWidget> createState() => _MenuListTileWidgetState();
}

class _MenuListTileWidgetState extends State<MenuListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.cake),
          title: Text('Birthdays'),
          onTap: (){
            Navigator.pop(context);
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => Birthdays(),
              )
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.sentiment_satisfied),
          title: Text('Gratitude'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => Gratitude(),
              )
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.alarm),
          title: Text('Reminders'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Reminders(),
              )
            );
          },
        ),
        Divider(color: Colors.grey,),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Setting'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}