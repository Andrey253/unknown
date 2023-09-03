import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';

import 'package:effective/old_model/category.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class CategoryesWidget extends StatelessWidget {
  const CategoryesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final block = context.read<HomeBloc>();

    final width = MediaQuery.of(context).size.width;

    return SizedBox(
        height: width * 0.3,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) => ListView(
                    scrollDirection: Axis.horizontal,
                    children: block.repository.listCategory
                        .map((e) => Column(
                            children: [itemCategory(block, e, width), nameCategory(width, e)]))
                        .toList()))));
  }

  SizedBox nameCategory(double width, Category e) {
    return SizedBox(
      height: width * 0.04,
      child: Text(e.name,
          style:
              TextStyle(color: e.selected ? ColorsConst.red : ColorsConst.textColor, fontSize: 15)),
    );
  }

  GestureDetector itemCategory(HomeBloc block, Category e, double width) {
    return GestureDetector(
      onTap: () => block.selectCategory(e),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: width * 0.04, horizontal: width * 0.02),
        child: Container(
            height: width * 0.18,
            width: width * 0.18,
            decoration: BoxDecoration(
              boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 2)],
              shape: BoxShape.circle,
              color: e.selected ? ColorsConst.red : Colors.white,
            ),
            child: Center(
              child: SvgIcon(
                  color: e.selected ? Colors.white : ColorsConst.grey,
                  size: width * 0.06,
                  icon: SvgIconData(e.asset)),
            )),
      ),
    );
  }
}
