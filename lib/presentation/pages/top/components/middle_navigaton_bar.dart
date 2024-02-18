import 'package:flutter/material.dart';

// TODO: CallBackを受け取り、indexの変更を上位に通知する。Providerだと、一つしか持てないので、他の画面にも変更が通知される
class MiddleNavigationBar extends StatefulWidget {
  const MiddleNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() => _MiddleNavigationBarState();
}

class _MiddleNavigationBarState extends State<MiddleNavigationBar> {
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
              icon: Icon(Icons.check),
              label: 'CheckIn',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: 'Edit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete),
              label: 'Delete',
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
