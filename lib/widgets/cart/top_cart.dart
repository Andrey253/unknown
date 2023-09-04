import 'package:effective/block/cart_block.dart';
import 'package:effective/block/cart_state.dart';
import 'package:effective/help/widgets.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/help/buttons_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TopCart extends StatelessWidget {
  const TopCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final block = context.read<CartBlock>();
    return BlocBuilder<CartBlock, CartState>(
        builder: (context, state) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonsApp(
                      width: width * 0.09,
                      height: width * 0.09,
                      circular: width * 0.02,
                      backgroundColor: ColorsConst.textColor,
                      child:
                          Icon(Icons.keyboard_arrow_left, size: width * 0.08),
                      onPressed: () => Navigator.of(context).pop()),
                  TextWS(
                    text: 'Add address',
                    width: width,
                    size: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorsConst.textColor,
                  ),
                  Stack(children: [
                    ButtonsApp(
                        width: width * 0.09,
                        height: width * 0.09,
                        circular: width * 0.02,
                        backgroundColor: ColorsConst.red,
                        onPressed: () {},
                        child: Icon(
                          Icons.place_outlined,
                          color: Colors.white,
                          size: width * 0.05,
                        )),

                  ])
                ],
              ),
            ));
  }
}
