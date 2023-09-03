import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:effective/block/details_block.dart';
import 'package:effective/block/details_state.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final block = context.read<DetailsBloc>();

    final width = MediaQuery.of(context).size.width;

    Widget itemBuilder(BuildContext context, DetailsBloc block, int index, int realIndex) {
      return Padding(
        padding: EdgeInsets.all(width * 0.02),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(spreadRadius: width * 0.01, blurRadius: width * 0.02, color: ColorsConst.grey)
          ], color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(width * 0.03))),
          child: Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: CachedNetworkImage(
                progressIndicatorBuilder: ((context, url, progress) => Center(
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(value: progress.progress)))),
                imageUrl: block.repository.details.images[index],
                height: width / 2.5,
                fit: BoxFit.fitWidth),
          ),
        ),
      );
    }

    return BlocBuilder<DetailsBloc, DetailsState>(
        buildWhen: (previous, current) => current is GetingDetailsDoneState,
        builder: (context, state) => state is GetingDetailsState
            ? const SizedBox.shrink()
            : CarouselSlider.builder(
                itemCount: block.repository.details.images.length,
                itemBuilder: (context, index, realIndex) =>
                    itemBuilder(context, block, index, realIndex),
                options: CarouselOptions(
                  enlargeFactor: 0.4,
                  aspectRatio: 6 / 39,
                  viewportFraction: 0.6,
                  height: width * 0.8,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                )));
  }
}
