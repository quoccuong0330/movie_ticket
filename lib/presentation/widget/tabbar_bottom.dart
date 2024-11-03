import 'package:flutter/material.dart';
import 'package:movie_ticket/presentation/page/welcome_screen.dart';

class TabbarBottom extends StatefulWidget {
  const TabbarBottom({super.key});

  @override
  State<TabbarBottom> createState() => _TabbarBottomState();
}

class _TabbarBottomState extends State<TabbarBottom> {
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home), backgroundColor: Colors.black, label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.home), backgroundColor: Colors.black, label: 'Movie'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.home), backgroundColor: Colors.black, label: 'Ticket'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        backgroundColor: Colors.black,
        label: 'Profile'),
  ];

  List listScreens = [];

  int activeScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listScreens[activeScreen],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        selectedItemColor: Colors.red,
        currentIndex: activeScreen,
        elevation: 0,
        backgroundColor: Colors.black,
        showSelectedLabels: true,
        unselectedItemColor: Colors.white,
        selectedFontSize: 12,
        onTap: (value) {
          setState(() {
            print(value);
            activeScreen = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        enableFeedback: false,
      ),
    );
  }
}
