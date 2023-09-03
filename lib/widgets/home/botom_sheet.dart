import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class BottonSheet extends StatelessWidget {
  const BottonSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => state is FilterState
            ? const SizedBox.shrink()
            : Container(
                height: 72,
                decoration: BoxDecoration(
                  color: ColorsConst.textColor,
                  borderRadius: BorderRadius.circular(width * 0.06),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          SvgIcon(
                              color: Colors.white,
                              size: width * 0.02,
                              icon: const SvgIconData('assets/svg/point.svg')),
                          SizedBox(width: width * 0.016),
                          Text(
                            'Explorer',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SvgIcon(
                          color: Colors.white,
                          size: width * 0.04,
                          icon: const SvgIconData('assets/svg/wallet.svg')),
                      SvgIcon(
                          color: Colors.white,
                          size: width * 0.04,
                          icon: const SvgIconData('assets/svg/favorit.svg')),
                      SvgIcon(
                          color: Colors.white,
                          size: width * 0.04,
                          icon: const SvgIconData('assets/svg/person.svg'))
                    ],
                  ),
                ),
              ));
  }
}
