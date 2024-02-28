import 'package:flutter/cupertino.dart';

class ActionButtonCard extends StatelessWidget {
  const ActionButtonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: CupertinoButton(
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
    );
  }
}
