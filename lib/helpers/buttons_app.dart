import 'package:flutter/material.dart';

class ButtonsApp extends StatelessWidget {
  const ButtonsApp({
    Key? key,
    required this.width,
    required this.height,
    required this.circular,
    required this.backgroundColor,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  final double width;
  final double height;
  final double circular;
  final Color? backgroundColor;
  final Widget child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(circular),
            ),
            backgroundColor: backgroundColor,
            minimumSize: Size(width, height), // Set this
            maximumSize: Size(width, height), // Set this
            padding: EdgeInsets.zero,
          ),
          child: child),
    );
  }
}
