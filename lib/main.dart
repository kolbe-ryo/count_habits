import 'package:flutter/material.dart';

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
  int count = 0;
  int prevCount = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            final position = Tween<Offset>(
              begin: prevCount < count
                  ? animation.isCompleted
                      ? const Offset(0, 1)
                      : const Offset(0, -1)
                  : animation.isCompleted
                      ? const Offset(0, -1)
                      : const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation);
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: position,
                child: child,
              ),
            );
          },
          child: Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'Increment',
            onPressed: () {
              prevCount = count;
              count++;
              setState(() {});
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'Decrement',
            onPressed: () {
              prevCount = count;
              count--;
              setState(() {});
            },
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
