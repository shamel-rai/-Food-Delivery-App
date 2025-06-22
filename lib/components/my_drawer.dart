import 'package:flutter/material.dart';
import 'package:recipe_app/components/my_drawer_tile.dart';
import 'package:recipe_app/pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // app logo
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(25),
            child: Divider(color: Theme.of(context).colorScheme.secondary),
          ),

          //Home list tile
          MyDrawerTile(
            text: "Home",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          //Setting List tile
          MyDrawerTile(
            text: "Setting",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingPage()),
              );
            },
          ),

          Spacer(),

          //Logout tile
          MyDrawerTile(text: "Logout", icon: Icons.logout, onTap: () {}),

          SizedBox(height: 35),
        ],
      ),
    );
  }
}
