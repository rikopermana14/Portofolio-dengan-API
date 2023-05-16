import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:utp/screens/Project.dart';
import 'package:utp/screens/profile_screen.dart';

class Buttom extends StatefulWidget {
  const Buttom({super.key});

  @override
  State<Buttom> createState() => _ButtomState();
}

class _ButtomState extends State<Buttom> {
  int currentIndex = 0;
  final List<Widget> body = [
    ProfileScreen(),
    ProjectScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar:
          BottomNavigationBar(onTap: ontap, currentIndex: currentIndex, items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.cyan,
          ),
          label: "Home",
          activeIcon: Icon(
            Icons.home_outlined,
            color: Colors.red,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.devices,
            color: Colors.cyan,
          ),
          label: "Projects",
          activeIcon: Icon(
            Icons.devices_outlined,
            color: Colors.red,
          ),
        ),
      ]),
    );
  }

  void ontap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
