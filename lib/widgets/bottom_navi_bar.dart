import 'package:flutter/material.dart';
import '../destinations.dart';

class BottomNaviBar extends StatelessWidget {
  const BottomNaviBar({
    super.key,
    this.onDestinationSelected,
  });

  final int selectedIndex = 0;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NavigationBar(
      elevation:0,
      backgroundColor: Colors.white,
      destinations: destinations.map<NavigationDestination>((d) {
        return NavigationDestination(icon: Icon(d.icon), label: d.label);
        }).toList(),
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,


);
  }
}
