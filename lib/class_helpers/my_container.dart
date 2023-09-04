import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: child,
      ),
    );
  }
}
