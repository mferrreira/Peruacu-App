import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Página Inicial",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: "Informações"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: "Agenda",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Pefil"),
      ],
    );
  }
}
