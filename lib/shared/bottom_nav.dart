import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
      // Stay on the current page
        break;
      case 1:
        Navigator.pushNamed(context, '/about');
        break;
      case 2:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex, // Tracks the currently selected item
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.graduationCap,
            size: 20,
            color: _currentIndex == 0 ? Colors.deepPurple[200] : Colors.grey,
          ),
          label: 'Topics',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.bolt,
            size: 20,
            color: _currentIndex == 1 ? Colors.deepPurple[200] : Colors.grey,
          ),
          label: 'About',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.circleUser,
            size: 20,
            color: _currentIndex == 2 ? Colors.deepPurple[200] : Colors.grey,
          ),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.deepPurple[200],
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    );
  }
}
