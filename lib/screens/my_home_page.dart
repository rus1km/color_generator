import 'package:color_generator/services/random_hue_value_generator.dart';
import 'package:flutter/material.dart';

/// This widget is the home page of your application. It is stateful, meaning
/// that it has a State object (defined below) that contains fields that
/// affect how it looks.
class MyHomePage extends StatefulWidget {
  /// This class is the configuration for the state. It holds the values (in
  /// this case the title) provided by the parent (in this case the App widget)
  /// and used by the build method of the State. Fields in a Widget subclass
  /// are always marked "final".
  const MyHomePage({
    required this.title,
    super.key,
  });

  /// This is the title of your application's home page.
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _hue = 0;

  // When this method is called background color is changes to another random
  // color with animation
  void _changeBackgroundColor() {
    final generator = RandomHueValueGenerator();
    setState(() => _hue = generator.generateRandomHue());
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return GestureDetector(
      onTap: _changeBackgroundColor,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: _hue),
        duration: const Duration(milliseconds: 1000),
        builder: (_, hue, __) {
          final hsvColor = HSVColor.fromAHSV(1.0, hue, 1.0, 1.0);

          return Scaffold(
            backgroundColor: hsvColor.toColor(),
            body: Center(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
