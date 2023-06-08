import 'package:flutter/material.dart';
import 'component/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(),
        body: Stack(
          children: [
            Row(
              children: [
                NavigationRail(
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
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
                Container(
                  child: Text('$_selectedIndex'),
                )
              ],
            ),
          ],
        )
    );
  }
}
