import 'package:effective/source/consts.dart';
import 'package:flutter/cupertino.dart';

class Flash extends StatelessWidget {
  const Flash({super.key, required this.splash});
  final bool splash;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedPositioned(
        top: splash ? 0 : size.height / 2,
        left: 0,
        height: splash ? size.height : 0,
        width: size.width,
        curve: Curves.easeInQuad,
        duration: const Duration(milliseconds: 200),
        child: SafeArea(
          child: Container(
            color: ColorsConst.textColor,
            child: Center(child: Image.asset('assets/images/splash.PNG')),
          ),
        ));
  }
}
