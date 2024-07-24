import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin/views/homescreen_view.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  final int _currentIndex = 0;
  final List<Widget> _children = [
    const HomescreenView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 110, 110, 108),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        onTap: (value) => (),
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.houseChimney,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.userGroup,
              ),
              label: "My Network"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.solidSquarePlus,
              ),
              label: "Post"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.solidBell,
              ),
              label: "Notifications"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.briefcase,
              ),
              label: "Jobs"),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}
