import 'package:flutter/material.dart';
import 'package:grocery_app/screens/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final List<Widget> pages = [
    HomeScreen(),
    Center(child: Text("Data")),
    HomeScreen(),
    Center(child: Text("Mail")),
    Center(child: Text("Profile")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black12,
        type: .fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,

        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: ''),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                shape: .circle,
                color: Colors.green,
              ),
              child: Icon(Icons.qr_code_scanner, color: Colors.white),
            ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
