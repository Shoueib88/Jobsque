import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    required this.list,
    super.key,
  });
  final List list;
  final int currentIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        currentIndex: currentIndex,
        onTap: onTap,
        iconSize: 30,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        items: [
          for (int i = 0; i < list.length; i++)
            BottomNavigationBarItem(
                icon: Image.asset(list[i]['icon']),
                label: list[i]['label'],
                activeIcon: Image.asset(list[i]['active'])),
        ]);
  }
}
