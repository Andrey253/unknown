import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerLine extends StatelessWidget {
  const BestSellerLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => state is FilterState
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Row(
                  children: const [
                    Text(
                      'Best Seller',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: ColorsConst.textColor),
                    ),
                    Spacer(),
                    Text(
                      'see more',
                      style: TextStyle(
                          fontSize: 17,
                          color: ColorsConst.red,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ));
  }
}
