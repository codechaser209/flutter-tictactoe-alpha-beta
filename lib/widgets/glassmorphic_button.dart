import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassmorphicButton extends StatelessWidget {
  final String title;
  const GlassmorphicButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
        width: 100 * MediaQuery.of(context).size.width / 360,
        height: 30 * MediaQuery.of(context).size.height / 740,
        borderRadius: 10 * MediaQuery.of(context).size.height / 740,
        linearGradient: const LinearGradient(colors: [
          Color.fromARGB(102, 255, 255, 255),
          Color.fromARGB(13, 255, 255, 255)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        border: 2 * MediaQuery.of(context).size.height / 740,
        blur: 40,
        borderGradient: const LinearGradient(colors: [
          Color.fromARGB(102, 255, 255, 255),
          Color.fromARGB(13, 255, 255, 255)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        child: Center(
            child: Text(title, style: Theme.of(context).textTheme.headline4)));
  }
}
