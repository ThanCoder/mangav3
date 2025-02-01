import 'package:flutter/material.dart';
import 'package:manga_v3/components/my_image_file.dart';
import 'package:manga_v3/constants.dart';
import 'package:manga_v3/desktop/screens/setting_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const Center(child: Text(appTitle)),
          DrawerHeader(
            child: MyImageFile(path: ''),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingScreen(),
                ),
              );
            },
            leading: const Icon(Icons.settings),
            title: const Text("Setting"),
          ),
        ],
      ),
    );
  }
}
