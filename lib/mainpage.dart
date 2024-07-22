import 'package:flutter/material.dart';
import 'package:linkedin/views/homescreen_view.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomescreenView(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          iconSize: 22,
          unselectedItemColor: const Color.fromARGB(255, 110, 110, 108),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
          onTap: (value) => (),
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.house,
                  size: 20,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                  size: 20,
                ),
                label: "My Network"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  size: 20,
                ),
                label: "Post"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  size: 20,
                ),
                label: "Notifications"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.backpack,
                  size: 20,
                ),
                label: "Jobs"),
          ],
        ),
        body: _children[_currentIndex],
      ),
    );
  }
}
