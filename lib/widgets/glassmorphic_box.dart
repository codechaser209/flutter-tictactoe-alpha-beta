import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassmorphicBox extends StatefulWidget {
  final String imageURL;
  const GlassmorphicBox({Key? key, required this.imageURL}) : super(key: key);

  @override
  State<GlassmorphicBox> createState() => _GlassmorphicBoxState();
}

class _GlassmorphicBoxState extends State<GlassmorphicBox> {
  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
        height: 80 * MediaQuery.of(context).size.height / 740,
        width: 80 * MediaQuery.of(context).size.width / 360,
        borderRadius: 10,
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
            child: widget.imageURL != ''
                ? Image.asset(widget.imageURL)
                : const Text('')));
  }
}
