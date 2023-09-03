import 'package:cached_network_image/cached_network_image.dart';
import 'package:effective/block/home_block.dart';
import 'package:effective/old_model/store/best_seller.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';

Container favorit(double width, BestSeller e) {
  return Container(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.all(width * 0.03),
        child: Container(
          height: width * 0.07,
          width: width * 0.07,
          decoration: const BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 2)],
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(e.isFavorites ? Icons.favorite : Icons.favorite_outline,
              color: ColorsConst.red, size: width * 0.036),
        ),
      ));
}

Padding infoProduct(double width, BestSeller e, HomeBloc block) {
  return Padding(
    padding: EdgeInsets.all(width * 0.013),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          errorWidget: (context, url, error) => Text(error.toString()),
          progressIndicatorBuilder: ((context, url, progress) => Center(
              child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(value: progress.progress)))),
          imageUrl: e.picture,
          height: width / 2.5,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.036),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(e.insertCharWithDiscount,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: width * 0.032)),
              SizedBox(width: width * 0.02),
              Text(e.insertCharWithoutDiscount,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.02,
                      decoration: TextDecoration.lineThrough))
            ],
          ),
        ),
        SizedBox(height: width * 0.012),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.036),
          child: Text(
            e.title,
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: width * 0.02),
          ),
        )
      ],
    ),
  );
}

Padding itemBestSeller(double width, BestSeller e, HomeBloc block) {
  return Padding(
    padding: EdgeInsets.all(width * 0.02),
    child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(width * 0.02)),
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 2)],
          color: Colors.white,
        ),
        child: Stack(
          children: [infoProduct(width, e, block), favorit(width, e)],
        )),
  );
}
