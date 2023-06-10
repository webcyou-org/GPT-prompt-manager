import 'package:flutter/material.dart';
import 'component/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  OverlayEntry? entry;

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
                  // useIndicator: true,
                  // indicatorColor: const Color(0xffffffff),
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) {
                    showOverlay();
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
                Expanded(
                    child: Scrollbar(
                        child: SingleChildScrollView(
                            child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(hintText: "Input"),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 30,
                      itemBuilder: (context, index) => ListTile(
                        title: Text("item ${index + 1}"),
                      ),
                    ),
                  ],
                )))),
              ],
            ),
          ],
        ));
  }

  void showOverlay() {
    entry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        left: 100,
        bottom: 20,
        child: ElevatedButton.icon(
          icon: Icon(Icons.stop_circle_rounded),
          label: Text('Record'),
          onPressed: () {},
        ),
      ),
    );

    final overlay = Overlay.of(context);
    overlay.insert(entry!);
  }
}
