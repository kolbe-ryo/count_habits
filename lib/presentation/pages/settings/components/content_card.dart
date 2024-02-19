import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        // boxShadow: const [
        //   BoxShadow(
        //     blurRadius: 10,
        //     offset: Offset(-10, -10),
        //     // color: Colors.white24,
        //   ),
        //   BoxShadow(
        //     blurRadius: 10,
        //     offset: Offset(10, 10),
        //     // color: Colors.grey,
        //   ),
        // ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const Icon(
              Icons.rocket_launch,
              color: Colors.black45,
              size: 48,
            ),
            const SizedBox(height: 8),
            Text(
              'タイトル',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            // 説明文
            Text(
              'ここに説明文が入ります。ここに説明文が入ります。ここに説明文が入ります。',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
