import 'package:count_habits/presentation/components/custom_animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomAnimatedFlipCounter(
          duration: const Duration(milliseconds: 1500),
          curve: Curves.bounceOut,
          textStyle: const TextStyle(
            fontSize: 200,
            fontWeight: FontWeight.w400,
            fontFamily: 'Hachi_Maru_Pop',
            color: Colors.yellow,
            shadows: [
              BoxShadow(
                color: Colors.red,
                offset: Offset(4, 4),
                blurRadius: 10,
              ),
            ],
          ),
          value: value,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'Increment',
        onPressed: () async {
          value++;
          setState(() {});
          await Future<void>.delayed(const Duration(milliseconds: 600));
          await HapticFeedback.vibrate();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
