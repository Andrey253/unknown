import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';

class SelectCategoryLine extends StatelessWidget {
  const SelectCategoryLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: const [
          Text(
            'Select category',
            style:
                TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: ColorsConst.textColor),
          ),
          Spacer(),
          Text(
            'view all',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: ColorsConst.red),
          )
        ],
      ),
    );
  }
}
