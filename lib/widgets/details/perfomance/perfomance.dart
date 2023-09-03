import 'package:effective/block/details_block.dart';
import 'package:effective/block/details_state.dart';
import 'package:effective/help/widgets.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/source/helper.dart';
import 'package:effective/source/stars.dart';
import 'package:effective/widgets/details/perfomance/tap_bar.dart';
import 'package:effective/help/buttons_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Perfomance extends StatelessWidget {
  const Perfomance({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final block = context.read<DetailsBloc>();
    return BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) => state is GetingDetailsState
            ? const SizedBox.shrink()
            : Padding(
                padding: EdgeInsets.only(top: width * 0.03),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(width * 0.08),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: width * 0.03,
                          offset: Offset(0, -width * 0.03))
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: width * 0.1),
                      tileProduct(width, block),
                      raitingProducrt(width, block),
                      PerfomanceBox(details: block.repository.details),
                      SizedBox(height: width * 0.07),
                      selectColorText(width),
                      perfomanceItems(width, block),
                      const SizedBox(height: 30),
                      addToCartButton(width, block),
                      SizedBox(height: width * 0.08)
                    ],
                  ),
                ),
              ));
  }

  Center addToCartButton(double width, DetailsBloc block) {
    return Center(
      child: ButtonsApp(
          width: width * 0.85,
          height: width * 0.13,
          circular: 15,
          backgroundColor: ColorsConst.red,
          onPressed: block.addToCart,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextWS(
                  text: 'Add to Cart',
                  width: width,
                  size: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              TextWS(
                  text: block.repository.details.priceProduct,
                  width: width,
                  size: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)
            ],
          )),
    );
  }

  Padding perfomanceItems(double width, DetailsBloc block) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.02, horizontal: width * 0.09),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...block.repository.details.color.map((e) => GestureDetector(
                onTap: () => block.setColor(e),
                child: CircleAvatar(
                  backgroundColor: colorFromHex(e),
                  child: e == block.repository.product.color ? const Icon(Icons.done) : null,
                ),
              )),
          SizedBox(width: width * 0.08),
          ...block.repository.details.capacity.map((e) => ButtonsApp(
              width: width * 0.17,
              height: width * 0.07,
              circular: width * 0.022,
              backgroundColor:
                  e == block.repository.product.capacity ? ColorsConst.red : Colors.white,
              onPressed: (() => block.setCapacity(e)),
              child: TextWS(
                  text: '$e GB',
                  width: width,
                  size: 13,
                  fontWeight: FontWeight.w700,
                  color: e == block.repository.product.capacity
                      ? Colors.white
                      : ColorsConst.capacity))),
        ],
      ),
    );
  }

  Padding selectColorText(double width) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.08),
      child: TextWS(
          text: 'Select color end capacity',
          width: width,
          size: 16,
          fontWeight: FontWeight.w500,
          color: ColorsConst.textColor),
    );
  }

  Padding raitingProducrt(double width, DetailsBloc block) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.06, bottom: width * 0.09),
      child: Stars(raiting: block.repository.details.rating),
    );
  }

  Padding tileProduct(double width, DetailsBloc block) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.08, right: width * 0.07),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWS(
            text: block.repository.details.title,
            width: width,
            size: 24,
            fontWeight: FontWeight.w500,
            color: ColorsConst.textColor,
          ),
          ButtonsApp(
              width: width * 0.09,
              height: width * 0.09,
              circular: width * 0.02,
              backgroundColor: ColorsConst.textColor,
              onPressed: () {},
              child: block.repository.details.isFavorites
                  ? const Icon(
                      Icons.favorite,
                      color: ColorsConst.red,
                    )
                  : const Icon(Icons.favorite_outline))
        ],
      ),
    );
  }
}
