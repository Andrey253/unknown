import 'package:cached_network_image/cached_network_image.dart';
import 'package:effective/block/cart_block.dart';
import 'package:effective/block/cart_state.dart';

import 'package:effective/help/button_add_remove.dart';
import 'package:effective/help/buttons_app.dart';
import 'package:effective/help/widgets.dart';

import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoxCart extends StatelessWidget {
  const BoxCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final block = context.read<CartBlock>();
    return Expanded(
      child: BlocBuilder<CartBlock, CartState>(builder: (context, state) {
        final width = MediaQuery.of(context).size.width;
        final listBasket = (block.repository.cart?.basket ?? [])
            .asMap()
            .map((i, element) => MapEntry(i, itemBuilder(i, block, context)))
            .values
            .toList();
        return Container(
          decoration: BoxDecoration(
            color: ColorsConst.textColor,
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * 0.06),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: ListView(
              children: [
                SizedBox(height: width * 0.08),
                ...listBasket,
                const Divider(height: 1, color: Colors.white),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.08,
                      top: width * 0.04,
                      bottom: width * 0.04),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.65,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWS(
                                text: 'Total',
                                width: width,
                                size: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                            SizedBox(height: width * 0.02),
                            TextWS(
                                text: 'Delivery',
                                width: width,
                                size: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWS(
                              text: block.repository.total,
                              width: width,
                              size: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                          SizedBox(height: width * 0.02),
                          TextWS(
                              text: 'Free',
                              width: width,
                              size: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(height: 1, color: Colors.white),
                SizedBox(height: width * 0.1),
                Center(
                  child: ButtonsApp(
                      width: width * 0.78,
                      height: width * 0.13,
                      circular: 10,
                      backgroundColor: ColorsConst.red,
                      onPressed: (() {}),
                      child: TextWS(
                          text: 'Checkout',
                          width: width,
                          size: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                ),
                SizedBox(height: width * 0.1)
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget itemBuilder(int index, CartBlock block, BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(width * 0.06),
      child: SizedBox(
        height: width * 0.2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width * 0.2,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: ColorsConst.backGround,
                borderRadius: BorderRadius.circular(width * 0.02),
              ),
              child: CachedNetworkImage(      progressIndicatorBuilder: ((context, url, progress) => Center(
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(value: progress.progress)))),
                imageUrl: block.repository.cart?.basket?[index]?.images ?? '',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: width * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWS(
                      text: block.repository.cart?.basket?[index]?.title ?? '',
                      width: width,
                      size: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  const Spacer(),
                  TextWS(
                      text: block.totalPriceOneProduct(index),
                      width: width,
                      size: 20,
                      fontWeight: FontWeight.w500,
                      color: ColorsConst.red)
                ],
              ),
            ),
            ButtonAddRemove(block: block, index: index, width: width)
          ],
        ),
      ),
    );
  }
}
