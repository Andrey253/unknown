import 'package:effective/block/cart_block.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class ButtonAddRemove extends StatelessWidget {
  const ButtonAddRemove({
    Key? key,
    required this.block,
    required this.index,
    required this.width,
  }) : super(key: key);

  final CartBlock block;
  final int index;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: width * 0.28,
          width: width * 0.08,
          decoration: BoxDecoration(
            color: ColorsConst.addRemoveBackground,
            borderRadius: BorderRadius.circular(width * 0.04),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: Colors.white),
                onPressed: null,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),

              IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: null,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
