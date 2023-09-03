import 'package:effective/block/cart_block.dart';
import 'package:effective/block/cart_state.dart';
import 'package:effective/help/widgets.dart';
import 'package:effective/repository/repository.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/cart/box_cart.dart';
import 'package:effective/widgets/cart/top_cart.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key, required this.repository});
  final Repository repository;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocProvider<CartBlock>(
        create: (_) =>
            CartBlock(type: const InitCartState(), repository: repository),
        child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: const TopCart(),
                shadowColor: Colors.transparent,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
              ),
              backgroundColor: ColorsConst.backGround,
              body:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                textMyCart(width),
                const BoxCart(),
              ])),
        ));
  }

  Padding textMyCart(double width) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * 0.08, vertical: width * 0.1),
      child: TextWS(
          text: 'My Cart',
          width: width,
          size: 35,
          fontWeight: FontWeight.w700,
          color: ColorsConst.textColor),
    );
  }
}
