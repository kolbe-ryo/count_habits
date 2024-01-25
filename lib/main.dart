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
  int prevCount = -1;
  final number = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: number,
          builder: (context, value, _) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                final position = Tween<Offset>(
                  begin: prevCount < value
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
                value.toString(),
                key: ValueKey<int>(value),
                style: const TextStyle(
                  fontSize: 200,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'Increment',
            onPressed: () {
              prevCount = number.value;
              number.value = prevCount + 1;
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'Decrement',
            onPressed: () {
              prevCount = number.value;
              number.value = prevCount - 1;
            },
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
