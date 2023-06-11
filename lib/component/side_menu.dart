import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const SideMenu({Key? key, this.onChanged}) : super(key: key);

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends State<SideMenu> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home, color: Colors.white),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.bookmark, color: Colors.white),
          label: Text('Prompt'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings, color: Colors.white),
          label: Text('Settings'),
        ),
      ],
      backgroundColor: const Color(0xff202123),
      // useIndicator: true,
      // indicatorColor: const Color(0xffffffff),
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        print(index);
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
