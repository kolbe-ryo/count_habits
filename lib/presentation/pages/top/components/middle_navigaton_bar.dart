import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MiddleNavigationBar extends ConsumerStatefulWidget {
  const MiddleNavigationBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MiddleNaState();
}

class _MiddleNaState extends ConsumerState<MiddleNavigationBar> {
  var _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.grey[800],
          currentIndex: _selectedIndex,
          enableFeedback: true,
          selectedItemColor: Colors.amber,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
