import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideBarDrawer extends StatelessWidget {
  const SideBarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(5),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.rectangle,
            ),
            child: Text(
              "Flutter Practices",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: const Text("Go Router"),
            onTap: () => context.pushNamed("/home"),
          ),
          ListTile(
            title: const Text("Gallery Picker"),
            onTap: () => context.goNamed("/gallery"),
          ),
        ],
      ),
    );
  }
}
