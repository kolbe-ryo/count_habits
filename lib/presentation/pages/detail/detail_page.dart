import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key});

  static Route<Object?> route() {
    return MaterialPageRoute(builder: (context) => const DetailPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder();
  }
}
