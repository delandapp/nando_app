import 'package:flutter/material.dart';

class CustomBottomBarMaterial extends StatelessWidget {

  final Color colorIcon = const Color(0xFFFFFFFF);
  final Color colorSelect = const Color(0xFFEA1818);
  final Color colorBackground = const Color(0xFF1B1B1D);
  final int currentIndex;
  final Function(int) onTap;


  CustomBottomBarMaterial({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color colorIcon= Color.fromRGBO(0, 0, 0, 1);
    const Color colorSelect= Color(0xFFE84218);
    const Color colorBackground= Color(0xFFFFFFFF);

    return BottomNavigationBar(
      unselectedItemColor: colorIcon,
      selectedItemColor: colorSelect,
      onTap: onTap,
      currentIndex: currentIndex,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorBackground,
      iconSize: 24,
      showUnselectedLabels: false,
      items: [
        _bottomNavigationBarItem(
          icon: Icons.person_2,
          label: 'Home',
        ),
        _bottomNavigationBarItem(
          icon: Icons.home,
          label: 'Book',
        ),
        _bottomNavigationBarItem(
          icon: Icons.history,
          label: 'Bookmark',
        ),
        _bottomNavigationBarItem(
          icon: Icons.bookmark,
          label: 'Profile',
        ),
      ],
    );
  }
  BottomNavigationBarItem _bottomNavigationBarItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
