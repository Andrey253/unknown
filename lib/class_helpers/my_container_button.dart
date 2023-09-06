import 'package:flutter/material.dart';

class MyContainerButton extends StatelessWidget {
  const MyContainerButton({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
        child: child,
      ),
    );
  }
}
