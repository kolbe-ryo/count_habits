import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionButtonCard extends StatelessWidget {
  const ActionButtonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CupertinoButton(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
              // padding: EdgeInsets.zero,
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Icon(
                  CupertinoIcons.info,
                  size: 40,
                ),
              ),
            ),
            CupertinoButton(
              borderRadius: BorderRadius.circular(50),
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 215, 215, 215),
                ),
                child: const Icon(
                  CupertinoIcons.multiply,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
